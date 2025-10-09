/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import ndkTest from 'libentry.so'
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';

const IMAGE_SUCCESS = 0;
const CALLBACK_FUC_DE = -1;
const CALLBACK_FUC_01 = 1;
const CALLBACK_FUC_02 = 2;
const CALLBACK_FUC_03 = 3;
const CALLBACK_FUC_04 = 4;

const PARA_ERROR_CODE = 7900201;

interface pixelMapPots {
  width: number,
  height: number,
  pixelFormat: number,
  editable: number,
  alphaType: number,
  scaleMode: number
}

let opts: pixelMapPots = {
  width: 4,
  height: 6,
  pixelFormat: 4,
  editable: 1,
  alphaType: 0,
  scaleMode: 1
};

export default function ImagePixelMapNDKTest() {
  describe('ImagePixelMapNDKTest', () => {
    let globalpixelmap:image.PixelMap;

    let sleep = (ms:number): Promise<void> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    beforeAll(async() => {
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      console.info('afterEach case');
    });
    afterAll(async() => {
      console.info('afterAll case');
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0100
     * @tc.name      :SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0100
     * @tc.desc      : OH_PixelMap_CreatePixelMap return error code
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0100', Level.LEVEL3, async (done:Function) => {
      const color = new ArrayBuffer(96);
      let res:number = ndkTest.createPixelMapSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0200
     * @tc.desc      : OH_PixelMap_CreatePixelMap returns error code
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0200', Level.LEVEL3, async (done:Function) => {
      const color = new ArrayBuffer(96);
      let res:number = ndkTest.createPixelMapThirdpartSkiaError(color, opts);
      expect(res).assertEqual(0);

      done()
    });



  })
}