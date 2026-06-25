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
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium';
import fs from '@ohos.file.fs';

const TAG =  'xtsStatic_packToDataSupp';
let filesDir: string | undefined | null;
let filePath: string = '';
let fdNumber: int;
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function copyImageToSandbox(fileName: string, pathUri: string): Promise<void> {
  const rawFileContent = testContext.resourceManager.getRawFileContentSync(fileName);
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  await fs.write(fd.fd, rawFileContent.buffer);
  await fs.close(fd);
}

async function packToDataPromiseTest(done: () => void, testName: string, pathUri: string,
  callback: (imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => Promise<void>) {
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  const imagePackerApi: image.ImagePacker = image.createImagePacker();
  if(imageSourceApi!= null){
    callback(imagePackerApi,imageSourceApi!);
  }else {
    console.error(TAG, testName,'imagecreateImageSourceObj is null');
    expect().assertFail();
    done();
  }
}

async function packToDataPixelMapPromiseTest(done: () => void, testName: string,
  callback: (imagePackerApi: image.ImagePacker,pixelMap: image.PixelMap) => Promise<void>) {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
  const pixelMap: image.PixelMap = await image.createPixelMap(color, opts)
  const imagePackerApi: image.ImagePacker = image.createImagePacker();
  if(imagePackerApi!= null){
    callback(imagePackerApi,pixelMap);
  }else {
    console.error(TAG, testName,'imagecreateImageSourceObj is null');
    expect().assertFail();
    done();
  }
}
async function sourceRelease(imageSourceApi: image.ImageSource, imagePackerApi: image.ImagePacker): Promise<void> {
  await imagePackerApi.release();
  await imageSourceApi!.release();
}
export default function imagePackerPackToDataTestSuppStatic(): void {
  describe('imagePackerPackToDataTestSuppStatic', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0100
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0100';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path,async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0200
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0200';
      const fileName = 'test.jpeg';
      const path =  new Date().getTime() +'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })



    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0300
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0300';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 90 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0400
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0400';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0500
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0500';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 10 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0600
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0600';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0700
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0700';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0800
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_promise_Supp_Static_0800';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToDataPromiseTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ) => {
        try {
          console.info(TAG, testName, 'call back start.');
          let data =await imagePackerApi.packToData(imageSourceApi!, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0100
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0100';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0200
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0200';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0300
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0300';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0400
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0400';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0500
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0500';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 90 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0600
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0600';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0700
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0700';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 10 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0800
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0800';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0900
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0900
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_0900';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_1000
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_1000
     * @tc.desc   imagePacker_packToData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToData_PixelMap_promise_Supp_Static_1000';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
await packToDataPixelMapPromiseTest(done, testName,  async (imagePackerApi, pixelMap) => {
        try {
          let data= await imagePackerApi!.packToData(pixelMap, packOpts);
          console.info(TAG, testName, 'Succeeded in packToData imageSourceApi successe.',data);
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFalse();
        }
        await imagePackerApi.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

  })
}