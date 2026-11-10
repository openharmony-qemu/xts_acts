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

import image from '@ohos.multimedia.image';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';

let pixelMap : image.PixelMap
const TAG = 'xtsCreatePixelMapFromSurfaceTest'

export default function ImageCreatePixelMapFromSurfaceTest() {
  describe('ImageCreatePixelMapFromSurfaceTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0100
     * @tc.number SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0100
     * @tc.desc   createPixelMapFromSurfaceWithTransformation "" INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0100';
      try {
        console.info(TAG,testName,"start :");
        pixelMap = await image.createPixelMapFromSurfaceWithTransformation("", true);
        console.info(TAG, testName, "res :", pixelMap);
        pixelMap?.release();
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(error.code).assertEqual(7600206)
      }
      done();
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0200
     * @tc.number SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0200
     * @tc.desc   createPixelMapFromSurfaceWithTransformation "" INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_0200';
      try {
        console.info(TAG,testName,"start :");
        let size: image.Size = {
          height: 480,
          width: 480
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        let mReceiverSurfaceId = await receiver!.getReceivingSurfaceId();
        console.info(TAG, testName, 'mReceiverSurfaceId:', mReceiverSurfaceId);
        pixelMap = await image.createPixelMapFromSurfaceWithTransformation(mReceiverSurfaceId, false);
        console.info(TAG, testName, "res :", pixelMap);
        pixelMap?.release();
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(error.code).assertEqual(7600104)
      }
      done();
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0100
     * @tc.number SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0100
     * @tc.desc   createPixelMapFromSurfaceWithTransformationSync "" INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0100';
      try {

        console.info(TAG,testName,"start :");
        pixelMap = image.createPixelMapFromSurfaceWithTransformationSync("", true);
        console.info(TAG, testName, "res :", pixelMap);
        pixelMap?.release();
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(error.code).assertEqual(7600206)
      }
      done();
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0200
     * @tc.number SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0200
     * @tc.desc   createPixelMapFromSurfaceWithTransformationSync "" INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_0200';
      try {
        console.info(TAG,testName,"start :");
        let size: image.Size = {
          height: 480,
          width: 480
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        let mReceiverSurfaceId = await receiver!.getReceivingSurfaceId();
        console.info(TAG, testName, 'mReceiverSurfaceId:', mReceiverSurfaceId);
        pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(mReceiverSurfaceId, false);
        console.info(TAG, testName, "res :", pixelMap);
        pixelMap?.release();
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(error.code).assertEqual(7600104)
      }
      done();
    })

  })
}