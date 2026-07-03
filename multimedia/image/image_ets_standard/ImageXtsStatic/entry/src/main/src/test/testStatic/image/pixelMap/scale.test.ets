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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { Context } from '@kit.AbilityKit';

const TAG = 'imageXts.scale';

let context: Context = Hypium.get("Context") as Context;

async function createPixelMapTest(context: Context): Promise<image.PixelMap> {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;
  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
  console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
  return pixelMap;
}

export default function pixelMapScaleTest(): void {
  describe('pixelMapScaleTest', () => {
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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0100
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0100";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        pixelMapObj.scale(scaleX, scaleY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
            expect(pixelMapObj != undefined).assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0200
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0200";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 0;
      let scaleY: int = 0;
      try {
        pixelMapObj.scale(scaleX, scaleY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
            expect(pixelMapObj != undefined).assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0300
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0300
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0300";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        pixelMapObj.scale(scaleX, scaleY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
            expect(pixelMapObj != undefined).assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0400
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0400
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0400";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 1.0;
      let scaleY: number = 2.0;
      try {
        pixelMapObj.scale(scaleX, scaleY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
            expect(pixelMapObj != undefined).assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0500
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0500
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0500";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        await pixelMapObj.scale(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0600
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0600
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0600";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 0;
      let scaleY: int = 0;
      try {
        await pixelMapObj.scale(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0700
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0700
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0700";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        await pixelMapObj.scale(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0800
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0800
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0800";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 1.0;
      let scaleY: number = 2.0;
      try {
        await pixelMapObj.scale(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0900
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0900
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_0900";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1000
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1000
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1000";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 1.0;
      let scaleY: number = 2.0;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1100
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1100";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 0;
      let scaleY: int = 0;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1200
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1200";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1300
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1300
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1300";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        await pixelMapObj.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1400
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1400
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1400', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1400";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 1.0;
      let scaleY: number = 2.0;
      try {
        await pixelMapObj.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1500
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1500
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1500', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1500";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 0;
      let scaleY: int = 0;
      try {
        await pixelMapObj.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1600
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1600
     * @tc.desc      scale cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1600', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1600";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        await pixelMapObj.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1700
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1700
     * @tc.desc      scale cover image.AntiAliasingLevel.NONE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1700', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1700";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        await pixelMapObj.scale(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1800
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1800
     * @tc.desc      scale cover image.AntiAliasingLevel.MEDIUM
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1800', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1800";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        await pixelMapObj.scale(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1900
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1900
     * @tc.desc      scale cover image.AntiAliasingLevel.HIGH
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1900', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_1900";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        await pixelMapObj.scale(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2000
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2000
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2000', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2000";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2100
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2100";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: number = 1.0;
      let scaleY: number = 2.0;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2200
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2200";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 0;
      let scaleY: int = 0;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2300
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2300
     * @tc.desc      scaleSync cover scaleX & scaleY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2300";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2400
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2400
     * @tc.desc      scaleSync cover image.AntiAliasingLevel.NONE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2400', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2400";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2500
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2500
     * @tc.desc      scaleSync cover image.AntiAliasingLevel.MEDIUM
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2500', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2500";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2600
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2600
     * @tc.desc      scaleSync cover image.AntiAliasingLevel.HIGH
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2600', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_SCALE_static_2600";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let scaleX: int = 999;
      let scaleY: int = 999;
      try {
        pixelMapObj.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, "Succeeded in scaling pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

  })
}
