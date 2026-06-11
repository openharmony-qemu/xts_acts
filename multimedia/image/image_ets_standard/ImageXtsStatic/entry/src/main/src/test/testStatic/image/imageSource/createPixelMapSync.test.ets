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

import { Context, } from '@kit.ArkUI';
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  Hypium,
  it,
  Level
} from '../../../../../../hypium';
import { image } from '@kit.ImageKit';

const TAG = 'xts.createPixelMapSync ';

async function createPixelMapSyncPromiseTest(done: () => void, testName: string, pathUri: string,
  options?: image.DecodingOptions) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let pixelMap: image.PixelMap | undefined = imageSourceApi!.createPixelMapSync(options);
  expect(pixelMap != undefined).assertTrue();
  imageSourceApi!.release();
  done();
}

async function createPixelMapSyncPromiseTest_color(done: () => void, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions, callback: (err: number) => void) {
  try {
    let pixelMap = image.createPixelMapSync(color, opts);
    expect(pixelMap.isEditable).assertEqual(opts.editable);
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code, testName);
    callback(error.code);
    done();
  }
}

async function createPixelMapSyncOptsPromiseTest(done: () => void, testName: string,
  opts: image.InitializationOptions, callback: (err: number) => void) {
  try {
    let pixelMap = image.createPixelMapSync(opts);
    expect(pixelMap.isEditable).assertEqual(opts.editable);
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code, testName);
    callback(error.code);
    done();
  }
}

async function createPixelMapSyncAbnormalPromiseTest(done: () => void, testName: string,
  color: ArrayBuffer | null | undefined,
  opts: image.InitializationOptions, callback: (err: number) => void) {
  try {
    let pixelMap = image.createPixelMapSync(color!, opts);
    expect().assertFail();
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code, testName);

    callback(error.code);
    done();
  }
}

export default function ImageSourceCreatePixelMapSyncTest(): void {
  describe('ImageSourceCreatePixelMapSyncTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0100
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0100
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0100';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0200
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0200
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0200';
      const path = 'test.svg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0300
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0300
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0300';
      const path = 'test.svg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0400
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0400
     * @tc.desc   imageSource_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_Sync_static_0400';
      const path = 'test.svg';
      try {
        await createPixelMapSyncPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   createPixelMapSync_promise_001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_001
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_002
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_003
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_004
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_004', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_005
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_005', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_006
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_006', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_007
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_007', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_008
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_008', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_009
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_009', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_010
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_010', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_011
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_011
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_011', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096)
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_012
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_012
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_012', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096);
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_013
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_013
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_013', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096);
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_014
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_014
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_014', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_016
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_016
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_016', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.OPAQUE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_017
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_017
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_017', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_017';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_018
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_018
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_018', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_018';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_005
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_005', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_006
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_006', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_007
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_007', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_008
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_008', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_009
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_009', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_010
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_010', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_011
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_011
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_011', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_012
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_012
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_012', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_013
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_013
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_013', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_014
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_014
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_014', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_015
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_015
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_015', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_016
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_016
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_016', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_017
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_017
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_017', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_017';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096);
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_018
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_018
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_018', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_018';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_019
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_019
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_019', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_020
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_020
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_020', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_020';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNKNOWN,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_021
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_021
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_021', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_021';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.OPAQUE,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_022
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_022
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_022', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_022';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNPREMUL,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_022a
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_022a
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_022a', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_022a';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.PREMUL,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_022b
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_022b
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_022b', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_022b';
      const opts: image.InitializationOptions =
        {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNPREMUL,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_023
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_023
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_023', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_023';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_024
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_024
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_024', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_024';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_025
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_025
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_025', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_025';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_026
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_026
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_026', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_026';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_027
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_027
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_027', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_027';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_028
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_028
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_028', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_028';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_029
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_029
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_029', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_029';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_030
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_030
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_030', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_030';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_031
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_031
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_031', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_031';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_032
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_032
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_032', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_032';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_033
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_033
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_033', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_033';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_034
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_034
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_034', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_034';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_035
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_035
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_035', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_035';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_036
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_036
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_036', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_036';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_037
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_037
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_037', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_037';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_038
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_038
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_038', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_option_promise_038';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts, (errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_039
     * @tc.number createPixelMapSync_promise_039
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_039', Level.LEVEL0, async (done: () => void) => {
      const testName = 'createPixelMapSync_promise_039';
      const color: ArrayBuffer = new ArrayBuffer(0);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096)
      });
    })
  })
}