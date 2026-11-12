'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@kit.BasicServicesKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import { Context } from '@kit.AbilityKit';

const TAG = 'Image.createPixelMapFromSurfaceSupp'
let fdNumber: number;

async function getFd(fileName: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

export default function ImageCreatePixelMapFromSurface() {
  describe('ImageCreatePixelMapFromSurface', () => {
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
     * @tc.name   SUB_Image_CreatePixelMapFromSurface_Promise_0100
     * @tc.number SUB_Image_CreatePixelMapFromSurface_Promise_0100
     * @tc.desc   surfaceId is''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Image_CreatePixelMapFromSurface_Promise_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_Image_CreatePixelMapFromSurface_Promise_0100';
      try {
        image.createPixelMapFromSurface('')
        console.info('Succeeded in creating pixelmap from Surface');
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Image_CreatePixelMapFromSurface_Sync_0100
     * @tc.number SUB_Image_CreatePixelMapFromSurface_Sync_0100
     * @tc.desc   surfaceId is''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Image_CreatePixelMapFromSurface_Sync_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_Image_CreatePixelMapFromSurface_Sync_0100';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync('');
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(62980178);
      }
      done();
    })
    
    /**
     * @tc.name   SUB_Image_CreatePixelMapFromSurface_Sync_0200
     * @tc.number SUB_Image_CreatePixelMapFromSurface_Sync_0200
     * @tc.desc   indexSurfaceId is '',region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Image_CreatePixelMapFromSurface_Sync_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_Image_CreatePixelMapFromSurface_Sync_0200';
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync('',region)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(62980178);
      }
      done();
    })

  })
}
