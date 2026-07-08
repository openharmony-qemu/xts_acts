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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '@ohos/hypium-binary/src/main/indexStatic';
import { BusinessError } from '@kit.BasicServicesKit';
import { Context } from '@kit.AbilityKit';

const TAG = 'imageXts.translate';

let context: Context = Hypium.get("Context") as Context;

async function createPixelMapTest(context : Context):Promise<image.PixelMap> {
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
  console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
  return pixelMap;
}

export default function pixelMapTranslateTest(): void {
  describe('pixelMapTranslateTest', () => {
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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0100
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0100";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: number = 50.0;
      let translateY: number = 10.0;
      try {
        pixelMapObj.translate(translateX, translateY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0200
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0200";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = 0;
      let translateY: int = 0;
      try {
        pixelMapObj.translate(translateX, translateY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0300
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0300
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0300";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = -10;
      let translateY: int = -10;
      try {
        pixelMapObj.translate(translateX, translateY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0400
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0400
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0400";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = 999;
      let translateY: int = 999;
      try {
        pixelMapObj.translate(translateX, translateY, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelMapObj. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0500
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0500
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0500";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: number = 50.0;
      let translateY: number = 10.0;
      try {
        await pixelMapObj.translate(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0600
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0600
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0600";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = 0;
      let translateY: int = 0;
      try {
        await pixelMapObj.translate(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0700
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0700
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0700";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = -10;
      let translateY: int = -10;
      try {
        await pixelMapObj.translate(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0800
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0800
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0800";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = 999;
      let translateY: int = 999;
      try {
        await pixelMapObj.translate(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0900
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0900
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_0900";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: number = 50.0;
      let translateY: number = 10.0;
      try {
        pixelMapObj.translateSync(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1000
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1000
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1000";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = 0;
      let translateY: int = 0;
      try {
        pixelMapObj.translateSync(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1100
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1100";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = -10;
      let translateY: int = -10;
      try {
        pixelMapObj.translateSync(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await pixelMapObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1200
     * @tc.desc      translate cover translateX & translateY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_TRANSLATE_static_1200";
      console.info(TAG, `start�?{testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let translateX: int = 999;
      let translateY: int = 999;
      try {
        pixelMapObj.translateSync(translateX, translateY);
        console.info(TAG, testName, "Succeeded in translating pixelMapObj.");
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
