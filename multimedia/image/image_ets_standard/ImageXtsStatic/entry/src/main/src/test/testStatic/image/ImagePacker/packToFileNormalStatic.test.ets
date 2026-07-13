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
import { BusinessError } from '@ohos.base';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '@ohos/hypium-binary/src/main/indexStatic';
import fs from '@ohos.file.fs';

const TAG =  'xtsStatic_packToFileStatic';

let filesDir: string | undefined | null;
let filePath: string = '';
let fdNumber: int;
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
const getFd = (fileName: string): int => {
  filePath =  testContext.filesDir + "/" + fileName;
  console.info(TAG,"image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};
async function copyImageToSandbox(fileName: string, pathUri: string): Promise<void> {
  const rawFileContent = testContext.resourceManager.getRawFileContentSync(fileName);
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  await fs.write(fd.fd, rawFileContent.buffer);
  await fs.close(fd);
}
async function pictureCreatImageSource(done: () => void,testName: string,pathUri: string, callback:(file: fs.File, imageSource:image.ImageSource|undefined ) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let path = `file://${testContext.filesDir}/${pathUri}`;
  let imageSource: image.ImageSource |undefined = image.createImageSource(path);
  try {
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource!);
      let targetpath = `file://${testContext.filesDir}/${testName}`;
      let file = fs.openSync(targetpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      callback(file,imageSource!);
    }
  } catch (err) {
    console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
    expect().assertFail();
  }finally {
    await imageSource!.release();
    done();
  }
}
async function packToFilePixelMapPromiseAndCallbackTest(done: () => void, testName: string, pathUri: string,
  callback:(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => Promise<void>): Promise<void> {
  const imagePackerApi: image.ImagePacker = await image.createImagePacker();
  try {
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    await callback(imagePackerApi,pixelmap,file);
  } catch (error) {
    console.info(TAG,testName, `failed; error: ${error},${error.code}`);
    expect().assertFail();
  }
  finally {
    await imagePackerApi.release();
    done();
  }
}
async function packToFileCallbackTest(done: () => void, testName: string, pathUri: string,
  callback: (imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => Promise<void>) {
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path) as image.ImageSource;
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    if(imagePackerApi!= null){
      callback(imagePackerApi,imageSourceApi!,file);
    }else {
      console.error(TAG, testName,'imagePackerObj is null');
      expect().assertFail();
      done();
    }
  Promise.all([
    imagePackerApi.release(),
    imageSourceApi!.release()
  ]
  ).then(() => {
    console.info(TAG, testName, 'pixelmap imagePackerObj release.');
    done();
  })
}
export default function imagePackerPackToFileStaticSuppTest(): void {
  describe('imagePackerPackToFileStaticSuppTest', (): void => {

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
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0100
     * @tc.desc       image.imageSource.packToFile,isEditable:false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0100';
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0300.jpg";
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, ' imageSourceObj getImageInfo succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0200
     * @tc.desc       image.imageSource.packToFile,isEditable:true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0200';
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0400.jpg";
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0300
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0300';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap!, file.fd, packOpts);
          const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imageSourceObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0400
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0400';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0500
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0500';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0600
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0600';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0700
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0700';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0800
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0800';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0900
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0900
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_0900';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1000
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1000
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1000';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1100
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_PIXELMAP_PROMISE_SUPP_static_1100';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path, async(imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap,file: fs.File) => {
          await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
          console.info(TAG, testName,'packToFile pixelmap Success.');
          const imagePackerObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
          const imageInfo =await imagePackerObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await pixelmap!.release();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0300
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0300';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0400
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0400';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0500
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0500';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0600
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0600';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0700
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0700';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0800
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0800';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0900
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0900
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0900';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1000
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1000
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1000';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1100
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1100
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_1100';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFilePixelMapPromiseAndCallbackTest(done, testName, path,
          async (imagePackerApi: image.ImagePacker, pixelmap: image.PixelMap, file: fs.File) => {
            imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
                expect().assertFail();
              } else {
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
                const imageInfo = imageSourceObj!.getImageInfoSync();
                console.info(TAG, testName, 'Packing succeeded.');
                expect(imageInfo!.size.width > 0).assertTrue();
              }
            })
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1000
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1000
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1000';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
      await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
          if (err) {
            console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName,'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
            const imageInfo = imageSourceObj!.getImageInfoSync();
            console.info(TAG, testName, 'Packing succeeded.');
            expect(imageInfo!.size.width > 0).assertTrue();
          }
        })
      })
    } catch (error) {
      console.info(TAG, testName, `failed; error: ${error},${error.code}`);
      expect().assertFail();
    }
  })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1100
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1100
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1100';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1200
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1200
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1200';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1300
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1300
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1300';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1400
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1400
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1400';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1500
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1500
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1500';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1600
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1600
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1600';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1700
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1700
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1700';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1800
     * @tc.number SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1800
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_1800';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0100
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0100';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0200
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0200';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0300
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0300';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0400
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0400';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0500
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0500';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0600
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0600';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0700
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0700';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0800
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_callback_SUPP_static_0800';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      await copyImageToSandbox(fileName, path);
      try {
        await packToFileCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts, (err) => {
            if (err) {
              console.error(TAG,testName, `Failed to pack the image to file.code ${err.code},message is ${(err as BusinessError).message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0300
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0300
     * @tc.desc       format: "image/png",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0300', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0300';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0400
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0400
     * @tc.desc       format: "image/png",needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0400', Level.LEVEL0,(done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0400';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0500
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0500
     * @tc.desc       format: "image/webp",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0500', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0500';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0600
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0600
     * @tc.desc       format: "image/webp",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0600', Level.LEVEL0,  (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0600';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0700
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0700
     * @tc.desc       format: "image/jpeg"，desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0700', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0700';
      pictureCreatImageSource(done,testName ,'test.jpeg',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 0
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0800
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0800
     * @tc.desc       format: "image/jpeg",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0800', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0800';
      pictureCreatImageSource(done,testName ,'test.jpeg',  (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: image.PackingDynamicRange.SDR,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0100
     * @tc.desc       format: "image/jpeg",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0100';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0200
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0200', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0200';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0300
     * @tc.desc       format: "image/png",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0300', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0300';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0400
     * @tc.desc       format: "image/png",needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0400', Level.LEVEL0,(done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0400';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0500
     * @tc.desc       format: "image/webp",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0500', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0500';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0600
     * @tc.desc       format: "image/webp",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0600', Level.LEVEL0,  (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0600';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0700
     * @tc.desc       format: "image/jpeg"，desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0700', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0700';
      pictureCreatImageSource(done,testName ,'test.jpeg',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 0
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0800
     * @tc.desc       format: "image/jpeg",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0800', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_SUPP_static_0800';
      pictureCreatImageSource(done,testName ,'test.jpeg', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: image.PackingDynamicRange.SDR,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
        imageSource!.release();
        done();
      })
    })
  })
}