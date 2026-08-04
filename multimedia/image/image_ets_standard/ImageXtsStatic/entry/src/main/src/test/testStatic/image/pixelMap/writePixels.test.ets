'use static';
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

import { AppStorage } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '../../../../../../hypium/index';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';
import { Context } from '@kit.AbilityKit';

const TAG = 'imageXts.pixelMapWritePixelsTest';

async function writePixelsNormalTest(done: () => void, testName: string, pixelMap: image.PixelMap | undefined,
  area: image.PositionArea, callback: (data: BusinessError<void>) => void) {
  try {
    if (pixelMap == undefined) {
      console.error(TAG, testName, 'pixelMap is undefined');
      expect().assertFail();
      done();
      return;
    }
    let bufferArr: Uint8Array = new Uint8Array(area.pixels);
    for (let i: int = 0; i < bufferArr.length; i++) {
      bufferArr[i] = i + 1;
    }
    pixelMap.writePixels(area, (error: BusinessError<void> | null) => {
      if (error) {
        console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
        callback(error as BusinessError<void>);
      }
      done();
    });
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function writePixelsAbnormalTest(done: () => void, testName: string, pixelMap: image.PixelMap | undefined,
  area: image.PositionArea, errorCallback: (data: string) => void) {
  try {
    if (pixelMap == undefined) {
      console.error(TAG, testName, 'pixelMap is undefined');
      expect().assertFail();
      done();
      return;
    }
    let bufferArr: Uint8Array = new Uint8Array(area.pixels);
    for (let i: int = 0; i < bufferArr.length; i++) {
      bufferArr[i] = i + 1;
    }
    pixelMap.writePixels(area, (error) => {
      if (error) {
        console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
        errorCallback(JSON.stringify(error));
      } else {
        console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
        expect().assertFail();
      }
      done();
    });
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getArrayBufferByUri(pathUri: string): Promise<ArrayBuffer> {
  let testContext: Context = Hypium.get("Context") as Context;
  let array = new ArrayBuffer(110000);
  let path = `file://${testContext.filesDir}/${pathUri}`;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let readLength = await fs.read(fd.fd, array);
  await fs.close(fd);
  console.info(TAG, `readLength: ${readLength}`);
  return array;
}

export default function pixelMapWritePixelsTest(): void {
  describe('pixelMapWritePixelsTest', () => {
    let testContext: Context = Hypium.get("Context") as Context;

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
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0100
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0100
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0100";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0200
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0200
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0200";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(20),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0300
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0300
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0300";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0400
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0400
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0400";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 4,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0500
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0500
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0500";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: -1,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0600
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0600
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0600";
      let color: ArrayBuffer = new ArrayBuffer(8);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0700
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0700
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0700";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0800
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0800
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0800";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 20000, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0900
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0900
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_0900";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(3000),
        offset: 0,
        stride: 40000,
        region: { size: { height: 2, width: 20000 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1000
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1000
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1000";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000000, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1100
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1100
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1100";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000000 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1200
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1200
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1200";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: -1, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1300
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1300
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1300";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: -1 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1400
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1400
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1400";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: -1, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1500
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1500
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1500";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: -1 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1600
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1600
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1600";
      let color = new ArrayBuffer(36);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1700
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1700
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1700";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(20),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1800
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1800
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1800";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(4),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1900
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1900
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_1900";
      let color: ArrayBuffer = new ArrayBuffer(4);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(9),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2000
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2000
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2000";
      let color: ArrayBuffer = new ArrayBuffer(6);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2100
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2100
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2100";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2200
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2200
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2200";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2300
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2300
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2300";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(18),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2400
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2400
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2400";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(14),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2500
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2500
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2500";
      let color: ArrayBuffer = new ArrayBuffer(14);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(24),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2600
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2600
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2600";
      let color = new ArrayBuffer(36);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2700
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2700
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2700";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(10),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2800
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2800
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2800";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(4),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2900
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2900
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2900', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_2900";
      let color: ArrayBuffer = new ArrayBuffer(4);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 1, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(9),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3000
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3000
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3000', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3000";
      let color: ArrayBuffer = new ArrayBuffer(6);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3100
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3100
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3100', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3100";
      let color = new ArrayBuffer(36);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3200
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3200
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3200', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3200";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(18),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3300
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3300
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3300";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(14),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3400
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3400
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3400', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3400";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(24),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertUndefined();
      });
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3500
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3500
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3500', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_writePixels_static_3500";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap | undefined = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
      done();
    })
  })
}