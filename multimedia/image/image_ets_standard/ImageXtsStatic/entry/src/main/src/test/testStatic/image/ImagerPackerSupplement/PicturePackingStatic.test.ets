"use static"
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../../../hypium';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { sleep } from '../../../ImageCommon.test';
import { BusinessError } from '@ohos.base';

const TAG =  'xtsStatic_Picture.PackingPictureSuppStatic';

let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
async function createPictureObj(done:()=>void, testName: string, pathUri: string): Promise<image.Picture|undefined> {
  try {
    let fileC = fs.openSync(pathUri, fs.OpenMode.READ_ONLY);
    const imageSourceObj: image.ImageSource |undefined= image.createImageSource(fileC.fd);
    console.info(TAG, testName, 'createImageSource Successful.');
    let commodityPixelMap: image.PixelMap |undefined = await imageSourceObj!.createPixelMap();
    console.info(TAG, testName, 'createPixelMap Successful.');
    fs.closeSync(fileC.fd);
    return image.createPicture(commodityPixelMap!);
  } catch (error) {
    console.error(TAG, testName, ` failed; error:`, JSON.stringify(error), error.code);
    expect().assertFail();
    return undefined;
  }
}
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
export default function PicturePackingPixMapSuppStatic(): void {
  describe('PicturePackingPixMapSuppStatic', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      await sleep(500);
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0100
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0100
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking image.PackingDynamicRange.AUTO/SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture|undefined = await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let ranges: image.PackingDynamicRange[] = [
          image.PackingDynamicRange.AUTO,
          image.PackingDynamicRange.SDR
        ]
        for (const range of ranges) {
          let opts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: range,
            quality: 0,
            needsPackProperties: true
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer!=undefined).assertTrue();
          done();
        }
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0200
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0200
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking image.needsPackProperties.true/false
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let booleanValues = [true, false]
        for (const flag of booleanValues) {
          let opts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties: flag,
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer!=undefined).assertTrue();
          done();
        }
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0300
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0300
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking image.needsPackProperties.true/false,png
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0300';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test_exif_v2.png";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/png",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0,
          needsPackProperties: true,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0400
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0400
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking desiredDynamicRange: image.PackingDynamicRange.AUTO,png
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0400';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test_exif_v2.png";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/png",
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          quality: 0,
          needsPackProperties: true,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0500
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0500
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking needsPackProperties: false,,png
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0500';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test_exif_v2.png";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/png",
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          quality: 0,
          needsPackProperties: false,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0600
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0600
     * @tc.desc    Packerpacking desiredDynamicRange: image.PackingDynamicRange.AUTO,webp
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0600';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/webp",
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          quality: 0,
          needsPackProperties: true,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0700
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0700
     * @tc.desc    desiredDynamicRange: image.PackingDynamicRange.AUTO needsPackProperties: false,webp
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0700';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/webp",
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          quality: 0,
          needsPackProperties: false,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0800
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0800
     * @tc.desc    esiredDynamicRange: image.PackingDynamicRange.SDR, needsPackProperties: true,webp
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0800';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/webp",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0,
          needsPackProperties: true,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0900
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0900
     * @tc.desc    desiredDynamicRange: image.PackingDynamicRange.SDR, needsPackProperties: true,webp
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_0900';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/webp",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0,
          needsPackProperties: false,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1000
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1000
     * @tc.desc    image.PackingDynamicRange.SDR needsPackProperties: false,png
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1000';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test_exif_v2.png";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let opts: image.PackingOption = {
          format: "image/png",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0,
          needsPackProperties: false,
        };
        let buffer = await imagePackerApi.packing(pictureObj!, opts)
        console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
        expect().assertFail();
        done();
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1100
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1100
     * @tc.desc    needsPackProperties: true ;image.PackingDynamicRange.AUTO/SDR/heic
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "all_auxtype.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(TAG,testName ,"device is not support heif encode");
        done();
      } else {
        try {
          let pictureObj: image.Picture | undefined = await createPictureObj(done, testName, path);
          const imagePackerApi: image.ImagePacker = await image.createImagePacker();
          console.info(TAG, testName, 'createImagePacker Successful.');
          let opts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange:  image.PackingDynamicRange.AUTO,
            quality: 0,
            needsPackProperties: true,
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer != undefined).assertTrue();
          done();
        } catch (error) {
          console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1200
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1200
     * @tc.desc    needsPackProperties: false,image.PackingDynamicRange.AUTO/SDR/heic
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "all_auxtype.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(TAG,testName ,"device is not support heif encode");
        done();
      } else {
        try {
          let pictureObj: image.Picture | undefined = await createPictureObj(done, testName, path);
          const imagePackerApi: image.ImagePacker = await image.createImagePacker();
          console.info(TAG, testName, 'createImagePacker Successful.');
          let opts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange:  image.PackingDynamicRange.AUTO,
            quality: 0,
            needsPackProperties: false,
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer != undefined).assertTrue();
          done();
        } catch (error) {
          console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1300
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1300
     * @tc.desc    needsPackProperties: false,image.PackingDynamicRange.AUTO/SDR/heic
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1300';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "all_auxtype.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(TAG,testName ,"device is not support heif encode");
        done();
      } else {
        try {
          let pictureObj: image.Picture | undefined = await createPictureObj(done, testName, path);
          const imagePackerApi: image.ImagePacker = await image.createImagePacker();
          console.info(TAG, testName, 'createImagePacker Successful.');
          let opts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange:  image.PackingDynamicRange.AUTO,
            quality: 0,
            needsPackProperties: true,
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer != undefined).assertTrue();
          done();
        } catch (error) {
          console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1400
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1400
     * @tc.desc    needsPackProperties: false,image.PackingDynamicRange.SDR/heic
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1400';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "all_auxtype.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(TAG,testName ,"device is not support heif encode");
        done();
      } else {
        try {
          let pictureObj: image.Picture | undefined = await createPictureObj(done, testName, path);
          const imagePackerApi: image.ImagePacker = await image.createImagePacker();
          console.info(TAG, testName, 'createImagePacker Successful.');
          let opts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange:  image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties: false,
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer != undefined).assertTrue();
          done();
        } catch (error) {
          console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1500
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1500
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking image.PackingDynamicRange.AUTO/SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1500';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture|undefined = await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let ranges: image.PackingDynamicRange[] = [
          image.PackingDynamicRange.AUTO,
          image.PackingDynamicRange.SDR
        ]
        for (const range of ranges) {
          let opts: image.PackingOption = {
            format: "image/gif",
            desiredDynamicRange: range,
            quality: 0,
            needsPackProperties: true
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect().assertFail();
          await imagePackerApi.release();
          done();
        }
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1600
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1600
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking image.needsPackProperties.true/false
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_Supp_static_1600';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let booleanValues = [true, false]
        for (const flag of booleanValues) {
          let opts: image.PackingOption = {
            format: "image/gif",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties: flag,
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer!=undefined).assertTrue();
          expect().assertFail();
          done();
        }
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })


  })
}