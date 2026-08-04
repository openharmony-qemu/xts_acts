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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium/index';
import fs from '@ohos.file.fs';

const TAG =  'xtsStatic_packToFilePictureStatic';

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

async function packToFilePicturePromiseTest(done: () => void, testName: string, pathUri: string,
  filename:string,callback:(imagePackerApi:image.ImagePacker ,pictureObj: image.Picture,file:fs.File)=> Promise<void>) {
  const imagePackerApi: image.ImagePacker = await image.createImagePacker();
  try {
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(filename);
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops) as image.ImageSource;
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap() as image.PixelMap;
    let pictureObj: image.Picture = image.createPicture(commodityPixelMap) as image.Picture;
    callback(imagePackerApi,pictureObj,file);
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
  }
  finally {
    await imagePackerApi.release();
    done();
  }
}

async function packToFilePromiseTest(done: () => void, testName: string, pathUri: string,
  callback: (imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => Promise<void>) {
  let fd: int = getFd('AllAuxiliaryPictures.jpg');
  const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
  const filePath: string = 'file://' + testContext.filesDir + "/" + pathUri;
  let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
  const imagePackerObj: image.ImagePacker = image.createImagePacker();
  if(imagePackerObj!= null){
    console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
    callback(imagePackerObj,imageSource!,file);
    await imageSource!.release();
    done();
  }else {
    console.error(TAG, testName,'imagePackerObj is null');
    expect().assertFail();
    done();
  }
}



export default function imagePackerPackToFilePictureStaticSuppTest(): void {
  describe('imagePackerPackToFilePictureStaticSuppTest', (): void => {

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
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0100
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0100';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_001_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0200
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0200';
      // const fileName = 'test.jpeg';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_002_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0300
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0300';
      const fileName = 'test.jpeg';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_003_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0400
     * @tc.desc   imagePacker_packToFile packOpts: image.PackingOption = { format: "image/png", quality: 98 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0400';
      // const fileName = 'test.jpeg';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_004_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0500
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0500';
      // const fileName = 'test.jpeg';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_005_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0600
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0600';
      // const fileName = 'test.jpeg';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_006_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0700
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0700';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_007_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0800
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_0800';
      // const fileName = 'test.jpeg';
      const path = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_SUPP_static_008_test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      try {
        await packToFilePromiseTest(done, testName, path, async(imagePackerObj:image.ImagePacker,imageSource: image.ImageSource | undefined ,file: fs.File) => {
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
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
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0100
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0100
     * @tc.desc    Test_SUB_MEDIA_IMAGE_imagePackerPacking_To_File cover desiredDynamicRange:SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName, 'openSync success',imageSourceApi);
      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap | undefined = await imageSourceApi!.createPixelMap();
        console.info(TAG, testName, 'commodityPixelMap success',commodityPixelMap);
        let pictureObj: image.Picture | undefined = image.createPicture(commodityPixelMap!);
        console.info(TAG, testName, 'image.createPicture(commodityPixelMap!) success',pictureObj);
        await imagePackerObj.packToFile(pictureObj!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
        expect(imageSourceObj!!=undefined).assertTrue();
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0200
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0200
     * @tc.desc    Test_SUB_MEDIA_IMAGE_imagePackerPacking_To_File cover needsPackProperties: false
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap |undefined= await imageSourceApi!.createPixelMap();
        console.info(TAG, testName, 'commodityPixelMap success',commodityPixelMap);
        let pictureObj: image.Picture |undefined = image.createPicture(commodityPixelMap!);
        console.info(TAG, testName, 'image.createPicture(commodityPixelMap!) success',pictureObj);
        await imagePackerObj.packToFile(pictureObj!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
        expect(imageSourceObj!!=undefined).assertTrue();
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0300
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0300
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0300';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePicturePromiseTest(done, testName, path, fileName,
          async (imagePackerApi: image.ImagePacker, pictureObj: image.Picture, file: fs.File) => {
            await imagePackerApi.packToFile(pictureObj, file.fd, packOpts)
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          })
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0400
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0400
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0400';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 100,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePicturePromiseTest(done, testName, path, fileName,
          async (imagePackerApi: image.ImagePacker, pictureObj: image.Picture, file: fs.File) => {
            await imagePackerApi.packToFile(pictureObj, file.fd, packOpts)
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          })
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0500
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0500
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0500';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePicturePromiseTest(done, testName, path, fileName,
          async (imagePackerApi: image.ImagePacker, pictureObj: image.Picture, file: fs.File) => {
            await imagePackerApi.packToFile(pictureObj, file.fd, packOpts)
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          })
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0600
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0600
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0600';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        needsPackProperties: true
      };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePicturePromiseTest(done, testName, path, fileName,
          async (imagePackerApi: image.ImagePacker, pictureObj: image.Picture, file: fs.File) => {
            await imagePackerApi.packToFile(pictureObj, file.fd, packOpts)
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          })
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0700
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0700
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PICTURE_PROMISE_Supp_static_0700';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        needsPackProperties: false
      };
      try {
        await copyImageToSandbox(fileName, path);
        await packToFilePicturePromiseTest(done, testName, path, fileName,
          async (imagePackerApi: image.ImagePacker, pictureObj: image.Picture, file: fs.File) => {
            await imagePackerApi.packToFile(pictureObj, file.fd, packOpts)
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          })
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image', error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0100
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0100
     * @tc.desc       format: "image/jpeg",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
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
          const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021.jpg";
          let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
              expect(imageSourceObj!!=undefined).assertTrue();
            }
          })
        }
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }finally {
        imageSource!.release();
        console.info(TAG, testName,'imageSource release success.');
        done();
      }
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0200
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0200
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0200', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_SUPP_static_0200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let booleanValues = [true, false]
        for (const flag of booleanValues) {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 98,
            needsPackProperties: flag
          };
          const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021.jpg";
          let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'image.createImagePacker() success',imagePackerObj);
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
              expect(imageSourceObj!!=undefined).assertTrue();
            }
          })
        }
      }catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }finally {
        imageSource!.release();
        console.info(TAG, testName,'imageSource release success.');
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0100
     * @tc.desc       image.imageSource.packToFile,isEditable:true/false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0100';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let booleanValues = [true, false];
        for (const flag of booleanValues) {
          const opts: image.InitializationOptions = {
            editable: flag,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: {height: 4, width: 6}
          };
          const path: string = `${testContext.filesDir}/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0100.jpg`;
          console.info(TAG, testName, 'path is:',path);
          let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
          console.info(TAG, testName, 'image.createPixelMap',pixelmap);
          const packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'image.createImagePacker',imagePackerObj);
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
              expect().assertFail();
            } else {
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
            Promise.all([
              pixelmap.release(),
              imagePackerObj!.release()
            ]
            ).then(() => {
              console.info(TAG, testName, 'pixelmap imagePackerObj release.');
              done();
            })
          })
        }
      }catch (err) {
        console.error(TAG, testName, `Unexpected error: code=${err.code}, msg=${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0200
     * @tc.desc       image.imageSource.packToFile,image.PackingDynamicRange.AUTO, needsPackProperties: true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0200';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        const path: string = `${testContext.filesDir}/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_SUPP_static_0200`;
        let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const packOpts: image.PackingOption = { format: "image/jpeg", desiredDynamicRange: image.PackingDynamicRange.AUTO, needsPackProperties: true,quality: 98 };
        const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
            expect().assertFail();
          } else {
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
            const imageInfo = imageSourceObj!.getImageInfoSync();
            console.info(TAG, testName, 'Packing succeeded.');
            expect(imageInfo!.size.width > 0).assertTrue();
          }
          Promise.all([
            pixelmap.release(),
            imagePackerObj!.release()
          ]
          ).then(() => {
            console.info(TAG, testName, 'pixelmap imagePackerObj release.');
            done();
          })
        })
      } catch (err) {
        console.error(TAG, testName, `Unexpected error: code=${err.code}, msg=${err.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}