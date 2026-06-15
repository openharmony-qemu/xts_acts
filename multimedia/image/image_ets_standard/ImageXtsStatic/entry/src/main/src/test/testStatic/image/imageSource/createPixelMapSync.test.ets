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
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '../../../../../../hypium';
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
  })
}