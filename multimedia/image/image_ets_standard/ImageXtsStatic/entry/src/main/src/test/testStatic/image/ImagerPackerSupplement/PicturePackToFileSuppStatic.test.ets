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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../../../hypium';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { sleep } from '../../../ImageCommon.test';
import { BusinessError } from '@ohos.base';

const TAG =  'xtsStatic_Picture.PackToFileSupp';

let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
let filesDir: string | undefined | null;
let filePath: string = '';
let fdNumber: int;


const getFd = (fileName: string): int => {
  filePath =  testContext.filesDir + "/" + fileName;
  console.info(TAG,"image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};

export default function PicturePackToFileSuppImageSourceTestStatic(): void {
  describe('PicturePackToFileSuppImageSourceTestStatic', () => {
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0100
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0100
     * @tc.desc       format: "image/jpeg",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0100';
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        let ranges: image.PackingDynamicRange[] = [
          image.PackingDynamicRange.AUTO,
          image.PackingDynamicRange.SDR
        ]
        for (const range of ranges) {
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          desiredDynamicRange:range,
          quality: 98
        };
          const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0100.jpg";
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
              console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
              expect(imageSourceObj!!=undefined).assertTrue();
              imageSource!.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        }
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0200
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0200
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0200';
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0,
          needsPackProperties: false
        };
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0200.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
      console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
      expect().assertFail();
    }
  })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0300
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0300
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0300', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0300';
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0300.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0400
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0400
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0400', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0400';
      let fd: int = getFd('test_exif_v2.png');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        quality: 0
      };
      try {
        const path: string = 'file://' + testContext.filesDir +"/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0400.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0500
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0500
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0500';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0
      };
      let fd: int = getFd('test_exif_v2.png');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0500.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0600
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0600
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0600';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:false
      };
      let fd: int = getFd('test_exif_v2.png');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir +"/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0600.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0700
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0700
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0700', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0700';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      let fd: int = getFd('test_exif_v2.png');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0700.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0800
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0800
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,   format: "image/webp",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0800', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0800';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        quality: 0
      };
      let fd: int = getFd('test_exif_v3.webp');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0800.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0900
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0900
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,  format: "image/webp",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0900';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0
      };
      let fd: int = getFd('test_exif_v3.webp');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0900.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1000
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1000
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1000';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:false
      };
      let fd: int = getFd('test_exif_v3.webp');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1000.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1100
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1100
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,  format: "image/webp",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1100';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      let fd: int = getFd('test_exif_v3.webp');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1100.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1200
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1200
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,format: "image/webp",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1200', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1200';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        quality: 0
      };
      let fd: int = getFd('test_exif_v3.webp');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir +  "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_1200.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'Succeeded in packing the image to file.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
            expect(imageSourceObj! != undefined).assertTrue();
            imageSource!.release();
            console.info(TAG, testName, 'imageSource release success.');
            done();
          }
        })
      } catch(err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })




    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0100
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0100
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0100';
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        let ranges: image.PackingDynamicRange[] = [
          image.PackingDynamicRange.AUTO,
          image.PackingDynamicRange.SDR
        ]
        for (const range of ranges) {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange:range,
            quality: 98
          };
          const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_01.jpg";
          let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
          console.info(TAG, testName, 'Succeeded in packing the image to file.');
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
          console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
          expect(imageSourceObj! != undefined).assertTrue();
          imageSource!.release();
          console.info(TAG, testName, 'imageSource release success.');
          done();
        }
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0200
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0200
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,needsPackProperties: false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0200', Level.LEVEL0,async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0200';
        let fd: int = getFd('AllAuxiliaryPictures.jpg');
        const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties: false
          };
          const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_Supp_static_0200.jpg";
          let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
          console.info(TAG, testName, 'Succeeded in packing the image to file.');
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
          console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
          expect(imageSourceObj! != undefined).assertTrue();
          imageSource!.release();
          console.info(TAG, testName, 'imageSource release success.');
          done();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0300
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0300
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0300';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties: false
      };
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0300.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
        expect(imageSourceObj! != undefined).assertTrue();
        imageSource!.release();
        console.info(TAG, testName, 'imageSource release success.');
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0400
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0400
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0400', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0400';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0400.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'Packing succeeded.', JSON.stringify(imageSourceObj!));
        expect(imageSourceObj! != undefined).assertTrue();
        imageSource!.release();
        console.info(TAG, testName, 'imageSource release success.');
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0500
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0500
     * @tc.desc       image.imageSource.packToFile,image/png&&getFd('AllAuxiliaryPictures.jpg'),errorcode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0500', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0500';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      let fd: int = getFd('test_exif_v2.png');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0500.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'packToFile imageSource succeeded.', JSON.stringify(imageSourceObj!));
        imageSource!.release();
        console.info(TAG, testName, 'imageSource release success.');
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();;
        done();
      }
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0600
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0600
     * @tc.desc       image.imageSource.packToFile, format: "image/webp",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0600', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0600';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      let fd: int = getFd('test_exif_v3.webp');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0600.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'packToFile imageSource succeeded.', JSON.stringify(imageSourceObj!));
        imageSource!.release();
        console.info(TAG, testName, 'imageSource release success.');
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();;
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0700
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0700
     * @tc.desc       image.imageSource.packToFile, format: "image/webp",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0700', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0700';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      let fd: int = getFd('test_exif_v3.webp');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0700.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'packToFile imageSource succeeded.', JSON.stringify(imageSourceObj!));
        imageSource!.release();
        console.info(TAG, testName, 'imageSource release success.');
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();;
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0800
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0800
     * @tc.desc       image.imageSource.packToFile, format: "image/png",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0800', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0800';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      let fd: int = getFd('test_exif_v2.png');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName,'create imageSource success.');
      try {
        const path: string = 'file://' + testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_Supp_Static_0800.jpg";
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
        imagePackerObj.packToFile(imageSource!, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'packToFile imageSource succeeded.', JSON.stringify(imageSourceObj!));
        imageSource!.release();
        console.info(TAG, testName, 'imageSource release success.');
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();;
        done();
      }
    })
  })
}