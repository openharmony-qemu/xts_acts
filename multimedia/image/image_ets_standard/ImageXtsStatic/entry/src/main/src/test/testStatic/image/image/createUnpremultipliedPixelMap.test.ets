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
import {afterAll,afterEach,beforeAll,beforeEach, describe, expect, it, Level } from '../../../../../../hypium';
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
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_10900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_11900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_12900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_13900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_14900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_15900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_16900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_17900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_18900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19100
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19200
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19300
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19400
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19500
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19600
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19700
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19800
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19900
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_19900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_20000
     * @tc.name     SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_20000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_20000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createUnPremultipliedPixelMap_static_20000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(Number(error.code)).assertEqual(401);
        });
    })
  })
}
