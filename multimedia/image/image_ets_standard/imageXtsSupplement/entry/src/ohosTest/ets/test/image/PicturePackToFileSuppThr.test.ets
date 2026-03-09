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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
const TAG = LOG_TAG + 'Picture.PackToFilePictureSupp';

async function pictureCreatImageSource(done: Function, testName: string,pathUri: string, callback:(file: fs.File,pixelMap: image.PixelMap) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource = image.createImageSource(path);
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource);
      let pixelMap: image.PixelMap = await imageSource.createPixelMap();
      console.info(TAG, testName,'creat pixelMap Success.',pixelMap);
      let targetPath = `file://${testContext.filesDir}/${testName}`;
      let file = fs.openSync(targetPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      callback(file,pixelMap);
    }
  } catch (err) {
    console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
    expect().assertFail();
  }
}

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

export default function PicturePackToFileTestThrSupp() {
  describe('PicturePackToFileTestThrSupp', () => {
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_01
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_01
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_01', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_01';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_02
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_02
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_02', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_02';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_03
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_03
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_03', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_03';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_04
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_04
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_04', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_04';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_05
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_05
     * @tc.desc       image.imageSource.packToFile,imageSource:null,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_05', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_05';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(null, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(Number(err.code)).assertEqual(401);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_06
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_06
     * @tc.desc       image.imageSource.packToFile,imageSource:undefined,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_06', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_06';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(undefined, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(Number(err.code)).assertEqual(401);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_07
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_07
     * @tc.desc       image.imageSource.packToFile,file.fd:undefined,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_07', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_07';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, undefined, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_08
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_08
     * @tc.desc       image.imageSource.packToFile,file.fd:null,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_08', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_08';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, null, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_09
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_09
     * @tc.desc       image.imageSource.packToFile,packOpts:null,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_09', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_09';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, null, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(62980115);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail()
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_010
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_010
     * @tc.desc       image.imageSource.packToFile,packOpts:undefined,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_010', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_010';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,pixelmap) => {
        try {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, null, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(62980115);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail()
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_011
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_011
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_011', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_011';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_012
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_012
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_012';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_013
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_013
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_013';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_014
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_014
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_014', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_014';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_015
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_015
     * @tc.desc       image.imageSource.packToFile,imageSource:null,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_015', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_015';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(null, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(Number(err.code)).assertEqual(401);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_016
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_016
     * @tc.desc       image.imageSource.packToFile,imageSource:undefined,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_016', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_016';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(undefined, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(Number(err.code)).assertEqual(401);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_017
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_017
     * @tc.desc       image.imageSource.packToFile,file.fd:undefined,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_017', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_017';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, undefined, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_018
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_018
     * @tc.desc       image.imageSource.packToFile,file.fd:null,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_018', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_018';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, null, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_019
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_019
     * @tc.desc       image.imageSource.packToFile,packOpts:null,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_019', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_019';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, null, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(62980115);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail()
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_020
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_020
     * @tc.desc       image.imageSource.packToFile,packOpts:undefined,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_020', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_PIXMAP_CALLBACK_020';
      pictureCreatImageSource(done,testName ,'test_exif_v2.webp', async (file,pixelmap) => {
        try {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(pixelmap, file.fd, null, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(62980115);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in packToFile(pixelmap,file.fd, packOpts).');
              expect().assertFail()
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
  })
}