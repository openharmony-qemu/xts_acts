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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'xts.CreateUnpremultipliedPixelMapSuppTest';

async function createUnpremultipliedPixelMapPromiseTest(done: () => void, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (errCode: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i: int = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[(i+1) as int] = 255;
      bufferArr[(i+2) as int] = 122;
      bufferArr[(i+3) as int] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatUnpre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(dstPixelMap));
    await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap)
    console.info(TAG + ' ' + testName + '  Succeeded in converting pixelmap.');
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG + ' ' + testName + '  Failed to convert pixelmap, error code is ' + JSON.stringify(error) + ' ' + error.code);
    callback(error as BusinessError);
    done();
  }
}

async function createUnpremultipliedPixelMapPromiseTestFirst(done: () => void, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (errCode: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i: int = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[(i+1) as int] = 255;
      bufferArr[(i+2) as int] = 122;
      bufferArr[(i+3) as int] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(dstPixelMap));
    await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap)
    console.info(TAG + ' ' + testName + '  Succeeded in converting pixelmap.');
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG + ' ' + testName + '  Failed to convert pixelmap, error code is ' + JSON.stringify(error) + ' ' + error.code);
    callback(error as BusinessError);
    done();
  }
}

async function createUnpremultipliedPixelMapCallbackTest(done: () => void, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (err: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i: int = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[(i+1) as int] = 255;
      bufferArr[(i+2) as int] = 122;
      bufferArr[(i+3) as int] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatUnpre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(dstPixelMap));
    image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError | null) => {
      if (error) {
        console.error(TAG + ' ' + testName + '  Failed to convert pixelmap, error code is ' + JSON.stringify(error) + ' ' + error.code);
        callback(error);
        done();
      } else {
        console.info(TAG + ' ' + testName + '  Succeeded in converting pixelmap.');
        expect().assertFail();
        done();
      }
    })
  } catch (error) {
    console.error(TAG + ' ' + testName + '  Test failed ' + JSON.stringify(error) + ' ' + error.code);
    expect().assertFail();
    done();
  }
}

async function createUnpremultipliedPixelMapCallbackTestFirst(done: () => void, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (err: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i: int = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[(i+1) as int] = 255;
      bufferArr[(i+2) as int] = 122;
      bufferArr[(i+3) as int] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG + ' ' + testName + ' ' + JSON.stringify(dstPixelMap));
    image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError | null) => {
      if (error) {
        console.error(TAG + ' ' + testName + '  Failed to convert pixelmap, error code is ' + JSON.stringify(error) + ' ' + error.code);
        callback(error);
        done();
      } else {
        console.info(TAG + ' ' + testName + '  Succeeded in converting pixelmap.');
        expect().assertFail();
        done();
      }
    })
  } catch (error) {
    console.error(TAG + ' ' + testName + '  Test failed ' + JSON.stringify(error) + ' ' + error.code);
    expect().assertFail();
    done();
  }
}

export default function createUnpremultipliedPixelMapSyncTest(): void {
  describe('createUnpremultipliedPixelMapSyncTest', (): void => {
    beforeAll(async () => {
      console.info(TAG + ' beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG + ' beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG + ' afterEach case.');
    });
    afterAll(() => {
      console.info(TAG + ' afterAll case.');
    });

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0it
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_0900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_1900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_2900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_3900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_4900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_5900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_6900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_7900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_8900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_9900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_0900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_1900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_2900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_3900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_4900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_5900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_6900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_7900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_8900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultiplied_PixelMap_static_9900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_0900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_1900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })


    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_2900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_3900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_callback_static_4200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTestFirst(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980248);
        });
    })

  })
}
