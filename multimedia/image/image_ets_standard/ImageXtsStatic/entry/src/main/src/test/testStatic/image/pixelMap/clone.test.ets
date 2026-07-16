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

import { Context } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '../../../../../../hypium/index';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'imageXts.clone';

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

function createPixelMapSUPP(context : Context):image.PixelMap {
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

export default function pixelMapCloneTest(): void {
  describe('pixelMapCloneTest', () => {

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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100
     * @tc.desc      clone isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100";
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(context);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await PixelMap!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200
     * @tc.desc      clone isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200";
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(context);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await PixelMap!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300
     * @tc.desc      clone isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300";
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(context);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await PixelMap!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400
     * @tc.desc      clone isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400";
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(context);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      await PixelMap!.release();
      done();
    })
  })
}