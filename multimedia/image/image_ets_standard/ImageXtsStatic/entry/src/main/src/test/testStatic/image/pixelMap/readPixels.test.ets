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

import { AppStorage } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '../../../../../../hypium';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';
import { Context, } from '@kit.ArkUI';

const TAG = 'imageXts.pixelMapReadPixelsTest';

async function getPixMap(fileName: string, decodingOptions: image.DecodingOptions) {
  let testContext: Context = Hypium.get("Context") as Context;
  let uri = 'file://' + testContext.filesDir + "/" + fileName;
  let imageSourceApi = image.createImageSource(uri);
  let pixelMap: image.PixelMap | undefined = await imageSourceApi!.createPixelMap(decodingOptions);
  return pixelMap;
}

async function readPixelsPromiseTest(done: () => void, testName: string, pixelMap: image.PixelMap | undefined,
  area: image.PositionArea, callback: (data: ArrayBuffer) => void) {
  try {
    if (pixelMap != undefined) {
      pixelMap.readPixels(area, (error) => {
        if (error) {
          console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        } else {
          console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
          callback(area.pixels);
        }
        done();
      })
    } else {
      console.error(TAG, testName, 'pixelMap is undefined');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`);
    expect().assertFail();
    done();
  }
}

async function readPixelsAbnormalPromiseTest(done: () => void, testName: string, pixelMap: image.PixelMap | undefined,
  area: image.PositionArea, errorCallback: (data: string) => void) {
  try {
    if (pixelMap != undefined) {
      pixelMap.readPixels(area, (error) => {
        if (error) {
          console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
          errorCallback(JSON.stringify(error));
        } else {
          console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
          expect().assertFail();
        }
        done();
      })
    } else {
      console.error(TAG, testName, 'pixelMap is undefined');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`);
    expect().assertFail();
    done();
  }
}

export default function pixelMapReadPixelsTest(): void {
  describe('pixelMapReadPixelsTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_READ_PIXELS_static_0100
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_READ_PIXELS_static_0100
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_READ_PIXELS_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_READ_PIXELS_static_0100";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap | undefined = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
      await pixelMap!.release();
      done();
    })
  })
}