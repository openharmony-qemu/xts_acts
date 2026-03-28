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

import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../hypium';
import { BusinessError } from '@ohos.base';
const TAG = 'imagePackerStaticTest';

async function pictureCreatImageSource(done: () => void,testName: string,pathUri: string, callback:(file: fs.File, imageSource:image.ImageSource|undefined ) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource |undefined = image.createImageSource(path);
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
  }
}
async function picturePixelMapCreatImageSource(done: () => void, testName: string,pathUri: string, callback:(file: fs.File,pixelMap: image.PixelMap|undefined) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource|undefined = image.createImageSource(path);
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource);
      let pixelMap: image.PixelMap |undefined = await imageSource.createPixelMap();
      console.info(TAG, testName,'creat pixelMap Success.',pixelMap!);
      let targetpath = `file://${testContext.filesDir}/${pathUri}`;
      let file = fs.openSync(targetpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      callback(file,pixelMap!);
    }
  } catch (err) {
    console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
    expect().assertFail();
  }
}
async function pictureCreatImagePixeMapSource(done: () => void, testName: string, pathUri: string, callback:(pixelMap: image.PixelMap,imageSource:image.ImageSource) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let path = `file://${testContext.filesDir}/${pathUri}`;
  console.info(TAG, testName, `path: ${path}`);
  let imageSource: image.ImageSource|undefined = image.createImageSource(path);
  console.info(TAG, testName,'create imageSource  Success.',imageSource!);
  let pixelMap: image.PixelMap |undefined = await imageSource!.createPixelMap();
  console.info(TAG, testName,'creat pixelMap Success.',pixelMap!);
  callback(pixelMap!,imageSource!);
}
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

 async function copyImageToSandbox(fileName: string, pathUri: string) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  const rawFileContent = testContext.resourceManager.getRawFileContentSync(fileName);
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  await fs.write(fd.fd, rawFileContent.buffer);
  await fs.close(fd);
}

export default function ImagePackerStaticTest(): void {
  describe('ImagePackerStaticTest', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string = '';
    let fdNumber: int;

    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };
    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = filesDir + "/" + fileName;
      return filePath;
    }

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
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019
     * @tc.desc    Test_imagePacker_Packing_To_File cover desiredDynamicRange:SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019';
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
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap | undefined = await imageSourceApi!.createPixelMap();
        let pictureObj: image.Picture | undefined = image.createPicture(commodityPixelMap!);
        await imagePackerObj.packToFile(pictureObj!, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020
     * @tc.desc    Test_imagePacker_Packing_To_File cover needsPackProperties: false
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020';
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
        const filePath: string = 'file://' + testContext.filesDir + "/IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap |undefined= await imageSourceApi!.createPixelMap();
        let pictureObj: image.Picture |undefined = image.createPicture(commodityPixelMap!);
        await imagePackerObj.packToFile(pictureObj!, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001
     * @tc.desc       format: "image/jpeg",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001';
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
            const filePath: string = 'file://' + testContext.filesDir + "/IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021.jpg";
            let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
              if (err) {
                console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName,'Succeeded in packing the image to file.');
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002';
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
            const filePath: string = 'file://' + testContext.filesDir + "/IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021.jpg";
            let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
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


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003
     * @tc.desc       format: "image/png",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004
     * @tc.desc       format: "image/png",needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004', Level.LEVEL0,(done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005
     * @tc.desc       format: "image/webp",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006
     * @tc.desc       format: "image/webp",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006', Level.LEVEL0,  (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007
     * @tc.desc       format: "image/jpeg"，desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008
     * @tc.desc       format: "image/jpeg",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_001
     * @tc.desc       format: "image/jpeg",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_001', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_001';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_002
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_002', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_002';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_003
     * @tc.desc       format: "image/png",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_003', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_003';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_004
     * @tc.desc       format: "image/png",needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_004', Level.LEVEL0,(done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_004';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_005
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_005
     * @tc.desc       format: "image/webp",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_005', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_005';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_006
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_006
     * @tc.desc       format: "image/webp",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_006', Level.LEVEL0,  (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_006';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_007
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_007
     * @tc.desc       format: "image/jpeg"，desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_007', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_007';
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_008
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_008
     * @tc.desc       format: "image/jpeg",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_008', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PROMISE_008';
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
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_01
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_01
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_01', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_01';
      picturePixelMapCreatImageSource(done,testName ,'test_exif_v2.png', (file,pixelMap) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: range,
              quality: 0
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(pixelMap!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_02
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_02
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_02', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXELMAP_PROMISE_02';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,pixelMap) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: image.PackingDynamicRange.SDR,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(pixelMap!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_03
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_03
     * @tc.desc       image.imageSource.packToFile,isEditable:false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_03', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_03';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/test_exif_v2.jpg";
        image.createPixelMap(color, opts).then(async (pixelmap: image.PixelMap|undefined) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
          let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
          const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd);
          const imageInfo =await imageSourceObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await imagePackerObj!.release();
          await pixelmap!.release();
        })
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_04
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_04
     * @tc.desc       image.imageSource.packToFile,isEditable:true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_04', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_PROMISE_04';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/test_exif_v2.jpg";
        image.createPixelMap(color, opts).then(async (pixelmap: image.PixelMap|undefined) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
          let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
          const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd);
          const imageInfo =await imageSourceObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await imagePackerObj!.release();
          await pixelmap!.release();
        })
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_001
     * @tc.desc       image.imageSource.packToFile,isEditable:true/false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_001';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let booleanValues = [true, false]
        for (const flag of booleanValues) {
          const opts: image.InitializationOptions = {
            editable: flag,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const path: string = `${testContext.filesDir}/ptest_exif_v2.jpg`;
          let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
          const packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
            // try {
            if (err) {
              console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
              expect().assertFail();
            } else {
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
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
    });

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_002
     * @tc.desc       第3个参数属性format:缺少空值""覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_002';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const path: string = `${testContext.filesDir}/test_exif_v2.jpg`;
          let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
          const packOpts: image.PackingOption = { format: "", quality: 98 };
          const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
            // try {
            if (err) {
              console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
              expect(err.code).assertEqual('401');
            } else {
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.',imageInfo);
              expect().assertFail();
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

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_003
     * @tc.desc       image.imageSource.packToFile,image.PackingDynamicRange.SDR,needsPackProperties: false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_003';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const path: string = `${testContext.filesDir}/test_exif_v2.jpg`;
          let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
          const packOpts: image.PackingOption = { format: "image/jpeg", desiredDynamicRange: image.PackingDynamicRange.SDR,needsPackProperties: false,quality: 98 };
          const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
              expect().assertFail();
            } else {
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
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
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_004
     * @tc.desc       image.imageSource.packToFile,image.PackingDynamicRange.AUTO, needsPackProperties: true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_004', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_004';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        const path: string = `${testContext.filesDir}/test_exif_v2.jpg`;
        let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const packOpts: image.PackingOption = { format: "image/jpeg", desiredDynamicRange: image.PackingDynamicRange.AUTO, needsPackProperties: true,quality: 98 };
        const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
            expect().assertFail();
          } else {
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
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



    /**
     * @tc.number  IMAGE_PACKER_PACKING_pictureObj_PROMISE_001
     * @tc.name    IMAGE_PACKER_PACKING_pictureObj_PROMISE_001
     * @tc.desc    imagePacker_packing image.PackingDynamicRange.AUTO/SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_pictureObj_PROMISE_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_PACKING_pictureObj_PROMISE_001';
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
     * @tc.number  IMAGE_PACKER_PACKING_pictureObj_PROMISE_001
     * @tc.name    IMAGE_PACKER_PACKING_pictureObj_PROMISE_001
     * @tc.desc    imagePacker_packing image.PackingDynamicRange.AUTO/SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_pictureObj_PROMISE_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_PACKING_pictureObj_PROMISE_001';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let booleanValues = [true, false]
        for (const flag of booleanValues) {
          let opts: image.PackingOption = {
            format: "image/png",
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
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001
     * @tc.desc    delayTimeList非空数组覆盖，test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001';
      // const path ='moving_test.gif';
      try {
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect(buffer.byteLength > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002
     * @tc.desc   disposalTypes:非空数组覆盖，delayTimeList空数组覆盖，test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002';
      // const path ='moving_test.gif';
      try {
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003
     * @tc.desc   disposalTypes:空数组覆盖,test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003';
      // const path ='moving_test.gif';
      try {
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect(buffer!=undefined).assertTrue();
        done();
       } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    })





    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001';
      pictureCreatImagePixeMapSource(done,testName ,'AllAuxiliaryPictures.jpg', (pixelMap,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 0,
              needsPackProperties: true
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            let data = imagePackerObj.packToData(pixelMap!, packOpts)
            console.info(TAG, testName, 'Succeeded in packToData the image.', data);
            expect(data != undefined).assertTrue();
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002
     * @tc.desc       desiredDynamicRange: image.needsPackProperties.true/false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002';
      pictureCreatImagePixeMapSource(done,testName ,'AllAuxiliaryPictures.jpg', (pixelMap,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange:image.PackingDynamicRange.AUTO,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            let data = imagePackerObj.packToData(pixelMap!, packOpts)
            console.info(TAG, testName, 'Succeeded in packToData the image.', data);
            expect(data != undefined).assertTrue();
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_001
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_001';
        // let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        let fd: int = getFd('AllAuxiliaryPictures_exclude_fragment.jpg');
        const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          let buffer = await imagePackerObj.packToData(imageSource!, packOpts)
          console.info(TAG, testName, 'Succeeded in packToData the image.', buffer);
          expect(buffer != undefined).assertTrue();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      imageSource!.release();
      done();
      })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_002
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_002';
      // let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('AllAuxiliaryPictures_exclude_fragment.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
        let buffer = await imagePackerObj.packToData(imageSource!, packOpts)
        console.info(TAG, testName, 'Succeeded in packToData the image.', buffer);
        expect(buffer != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      imageSource!.release();
      done();
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_003
     * @tc.desc       needsPackProperties:true/false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_ImageSource_Promise_003';
      // let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('AllAuxiliaryPictures_exclude_fragment.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      let booleanValues = [true, false]
      try {
        for (const flag of booleanValues) {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 98,
            needsPackProperties: flag
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
          let buffer = await imagePackerObj.packToData(imageSource!, packOpts)
          console.info(TAG, testName, 'Succeeded in packToData the image.', buffer);
          expect(buffer != undefined).assertTrue();
        }
      }catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      imageSource!.release();
      done();
    })


    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_001
     * @tc.number imagePacker_packToFileFromPixelmapSequence_promise_001
     * @tc.desc   第3个参数属性delayTimeList:非空数组覆盖，pixelMapList非空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_001';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const fileName = 'test6.gif';
      const path = 'file://' + testContext.filesDir + "/" + new Date().getTime() + fileName;
      try {
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        await copyImageToSandbox(fileName, path);
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(fileName);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = await imageSource!.createPixelMapList();
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
        let state = await fs.stat(file.fd);
        expect(state.ino > 0).assertTrue;
        await Packer.release();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(err.code).assertEqual('');
      }
      done();
    })


    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_002
     * @tc.number imagePacker_packToFileFromPixelmapSequence_promise_002
     * @tc.desc   第3个参数属性delayTimeList:空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_002'
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
        try {
          let pixelMapList = await imageSource!.createPixelMapList();
          let outputPath = `${testContext.filesDir}/${outputPathUri}`;
          let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          let Packer = image.createImagePacker();
          await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack)
          console.info(TAG,testName,'Succeeded in packToFileMultiFrames.');
          let state= await fs.stat( file.fd);
          expect(state.ino>0).assertTrue;
          await Packer.release();
          done();
        } catch (error) {
          console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
          expect(error.code).assertEqual(9001005);
          done();
        }
      })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_promise_003
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_promise_003
     * @tc.desc    Packer.packToFileFromPixelmapSequence,disposalTypes: []
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_003';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [],
        loopCount: 0
      };
      try {
        let pixelMapList = await imageSource!.createPixelMapList();
        let outputPath = `${testContext.filesDir}/${outputPathUri}`;
        let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack)
        expect().assertFail();
        await Packer.release();
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_release_001
     * @tc.name    IMAGE_PACKER_release_001
     * @tc.desc    imagePackerObj.release调用
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_release_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'IMAGE_PACKER_release_001';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('test_exif_v2.jpg');
      // const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName,'Succeeded in image.createImagePacker().',imagePackerObj);
        imagePackerObj.release((err: BusinessError|null)=>{
          if (err) {
            console.error(TAG, testName,`Failed to release image packaging.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName,'Succeeded in releasing image packaging.');
          }
        })
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
      }
      done();
    })
  })
}