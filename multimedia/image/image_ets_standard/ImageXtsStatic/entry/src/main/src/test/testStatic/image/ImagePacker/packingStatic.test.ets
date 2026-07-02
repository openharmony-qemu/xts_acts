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
import common from '@ohos.app.ability.common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium';
import fs from '@ohos.file.fs';

const TAG =  'xtsStatic_packingStatic';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function packingPromiseTest(done: () => void, testName: string, path: string,
callback:(pictureObj: image.Picture,imagePackerApi: image.ImagePacker)=> Promise<void>) {
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource | undefined = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.PixelMap | undefined = await imageSource!.createPixelMap();
    let pictureObj: image.Picture = await image.createPicture(commodityPixelMap!);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    if (imagePackerApi != null) {
      callback(pictureObj,imagePackerApi)
    }else {
      console.error(TAG, testName,'createImagePacker is null');
      expect().assertFail();
      done();
    }
}

export default function imagePackerPackingSuppStaticTest(): void {
  describe('imagePackerPackingSuppStaticTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0100
     * @tc.desc   imagePacker_packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0100';
      const path = 'test.jpeg';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
    await packingPromiseTest(done, testName, path, async(pictureObj: image.Picture,imagePackerApi: image.ImagePacker) => {
      try {
        console.info(TAG, testName, 'call back start.');
        let data= await imagePackerApi.packing(pictureObj, opts);
        console.info(TAG, testName, 'Succeeded in packing pictureObj successe.',data);
        expect(data != undefined).assertTrue();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFalse();
      }
      await imagePackerApi.release()
      console.info(TAG, testName, 'done');
      done();
    })
  })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0200
     * @tc.desc   imagePacker_packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0200';
      const path = 'test.jpeg';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98
      };
      await packingPromiseTest(done, testName, path, async(pictureObj: image.Picture,imagePackerApi: image.ImagePacker) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data= await imagePackerApi.packing(pictureObj, opts);
          console.info(TAG, testName, 'Succeeded in packing pictureObj successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0300
     * @tc.desc   imagePacker_packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0300';
      const path = 'test_exif_empty2.webp';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await packingPromiseTest(done, testName, path, async(pictureObj: image.Picture,imagePackerApi: image.ImagePacker) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data= await imagePackerApi.packing(pictureObj, opts);
          console.info(TAG, testName, 'Succeeded in packing pictureObj successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0400
     * @tc.desc   imagePacker_packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packing_promise_Supp_Static_0400';
      const path = 'test7.png';
      const opts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: false
      };
      await packingPromiseTest(done, testName, path, async(pictureObj: image.Picture,imagePackerApi: image.ImagePacker) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data= await imagePackerApi.packing(pictureObj, opts);
          console.info(TAG, testName, 'Succeeded in packing pictureObj successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
      })
    })
  })
}