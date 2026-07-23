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

import { image } from '@kit.ImageKit';
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium/index';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
const TAG = 'xts_static_ImageSourceTest'


export default function ImageSourceTest(): void {
  describe('ImageSourceTest', () => {
    let filePath: string = '';
    let fdNumber: int;
    const getFd = (fileName: string): int => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/" + fileName;
      console.info(TAG, "image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };
    const getFilePath = async (fileName: string): Promise<string> => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/" + fileName;
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
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100
     * @tc.desc      createImageRawData normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
       it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0100";
        try {
          let filePath = await getFilePath("meta.dng");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageRawData = await imageSourceObj!.createImageRawData();
          console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
          expect(imageRawData!.bitsPerPixel).assertEqual(16);
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
  
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200
       * @tc.desc      createImageRawData abnormal filePath:jpg,7700102
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0200";
        try {
          let filePath = await getFilePath("test_exif_v2.jpg");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageRawData = await imageSourceObj!.createImageRawData();
          console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7700102);
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300
       * @tc.desc      createImageRawData cover abnormal filePath:"",7700102
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0300";
        try {
          let filePath = await getFilePath("");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageRawData = await imageSourceObj!.createImageRawData();
          console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7700102);
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400
       * @tc.desc      createImageRawData cover abnormal filePath:"",7700101
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createImageRawData_STATIC_0400";
        try {
          let filePath = await getFilePath("fake.dng");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageRawData = await imageSourceObj!.createImageRawData();
          console.info(TAG, testName, `createImageRawData success`,imageRawData!.bitsPerPixel);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7700101);
        }
        done();
      })
  
  
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100
       * @tc.desc      readImageMetadataByType normal parameter metaData.exifMetadata，metaData.dngMetadata
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0100";
        try {
          let filePath = await getFilePath("meta.dng");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          let types: image.MetadataType[] = [];
          let  metaData = await imageSourceObj!.readImageMetadataByType(types, 0)
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, metaData.exifMetadata);
          expect(metaData.exifMetadata!=undefined).assertTrue();
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata!.dngVersion));
          let dngVersion = JSON.stringify(metaData.dngMetadata!.dngVersion);
          expect(dngVersion).assertEqual("[1,4,0,0]");
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata!.dngBackwardVersion));
          let dngBackwardVersion = JSON.stringify(metaData.dngMetadata!.dngBackwardVersion);
          expect(dngBackwardVersion).assertEqual("[1,1,0,0]");
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata!.uniqueCameraModel));
          expect(metaData.dngMetadata!.uniqueCameraModel).assertEqual('CLS-AL00-HUAWEI-HUAWEI');
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata!.cfaPlaneColor`, metaData.dngMetadata!.cfaPlaneColor);
          let cfaPlaneColor = JSON.stringify(metaData.dngMetadata!.cfaPlaneColor);
          expect(cfaPlaneColor).assertEqual("[0,1,2]");
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata!.cfaLayout`, metaData.dngMetadata!.cfaLayout);
          let cfaLayout = JSON.stringify(metaData.dngMetadata!.cfaLayout);
          expect(cfaLayout).assertEqual("1");
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata!.blackLevelRepeatDim`, metaData.dngMetadata!.blackLevelRepeatDim);
          let blackLevelRepeatDim = JSON.stringify(metaData.dngMetadata!.blackLevelRepeatDim);
          expect(blackLevelRepeatDim).assertEqual("[2,2]");
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata!.blackLevel`, metaData.dngMetadata!.blackLevel);
          let blackLevel = JSON.stringify(metaData.dngMetadata!.blackLevel);
          expect(blackLevel).assertEqual("[256,256,256,256]");
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata!.whiteLevel`, metaData.dngMetadata!.whiteLevel);
          let whiteLevel = JSON.stringify(metaData.dngMetadata!.whiteLevel);
          expect(whiteLevel).assertEqual("[4095]");
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
  
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200
       * @tc.desc      readImageMetadataByType normal parameter metaData.webPMetadata
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadataByType_STATIC_0200";
        try {
          let filePath = await getFilePath("test_exif_v3.webp");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          let types: image.MetadataType[] = [];
          let  metaData = await imageSourceObj!.readImageMetadataByType(types, 0)
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`,metaData.webPMetadata);
          expect(metaData.webPMetadata!=undefined).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0100
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0100
       * @tc.desc      readImageMetadata abnormal parameter 7700102
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0100', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0100";
        let formats = image.getImageSourceSupportedFormats();
        console.info(TAG, testName, `getImageSourceSupportedFormats`, formats!);
        if(formats!.includes("image/x-adobe-dng")){
          try {
            let filePath = await getFilePath("meta.dng");
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
            console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
            let propertyKeys = ["GifDelayTime", "GifDisposalType"];
            let imageMetadata = await imageSourceObj!.readImageMetadata(propertyKeys);
            console.info(TAG, testName, `readImageMetadata success`,imageMetadata);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect(error.code).assertEqual(7700102);
          }
        }else {
          console.info(TAG,testName,` device is not support decode x-adobe-dng!`);
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0200
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0200
       * @tc.desc      readImageMetadata cover abnormal filePath:"",7700204
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0200', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0200";
        try {
          let filePath = await getFilePath("");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageMetadata = await imageSourceObj!.readImageMetadata();
          console.info(TAG, testName, `readImageMetadata success`,imageMetadata);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7700204);
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0300
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0300
       * @tc.desc      readImageMetadata cover abnormal imageMetadata.exifMetadata,imageMetadata.dngMetadata
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0300', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0300";
        try {
          let filePath = await getFilePath("test_exif_v2.jpg");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageMetadata = await imageSourceObj!.readImageMetadata();
          console.info(TAG, testName, `readImageMetadata success`,imageMetadata);
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,exifMetadata`,JSON.stringify(imageMetadata.exifMetadata));
          expect(imageMetadata.exifMetadata!=undefined).assertTrue();
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,makerNoteHuaweiMetadata,`,JSON.stringify(imageMetadata.makerNoteHuaweiMetadata));
          expect(imageMetadata.makerNoteHuaweiMetadata!=undefined).assertTrue();
          expect(imageMetadata.makerNoteHuaweiMetadata!.sceneVersion).assertEqual(1);
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,heifsMetadata,`,JSON.stringify(imageMetadata.heifsMetadata));
  
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0400
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0400
       * @tc.desc      readImageMetadata cover abnormal imageMetadata.webPMetadata
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0400', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0400";
        try {
          let filePath = await getFilePath("test_exif_v3.webp");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageMetadata = await imageSourceObj!.readImageMetadata();
          console.info(TAG, testName, `readImageMetadata success`,imageMetadata);
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,webPMetadata,`,JSON.stringify(imageMetadata.webPMetadata));
          expect(imageMetadata.webPMetadata!=undefined).assertTrue();
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,canvasWidth,`,JSON.stringify(imageMetadata.webPMetadata!.canvasWidth));
          expect(imageMetadata.webPMetadata!.canvasWidth).assertEqual(1212);
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,canvasHeight,`,JSON.stringify(imageMetadata.webPMetadata!.canvasHeight));
          expect(imageMetadata.webPMetadata!.canvasHeight).assertEqual(681);
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0500
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0500
       * @tc.desc      readImageMetadata normal parameter imageMetadata.webPMetadata.delayTime.unclampedDelayTime.loopCount
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0500', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0500";
        try {
          let filePath = await getFilePath("moving_test.webp");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          let imageMetadata = await imageSourceObj!.readImageMetadata();
          console.info(TAG, testName, `readImageMetadata success`,imageMetadata.webPMetadata!.delayTime);
          expect(imageMetadata.webPMetadata!.delayTime).assertEqual(1000);
          console.info(TAG, testName, `readImageMetadata success`,imageMetadata.webPMetadata!.unclampedDelayTime);
          expect(imageMetadata.webPMetadata!.unclampedDelayTime).assertEqual(1000);
          console.info(TAG, testName, `readImageMetadata success`,imageMetadata.webPMetadata!.loopCount);
          expect(imageMetadata.webPMetadata!.loopCount).assertEqual(0);
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0600
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0600
       * @tc.desc      readImageMetadata cover abnormal imageMetadata.dngMetadata
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0600', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_readImageMetadata_STATIC_0600";
        try {
          let filePath = await getFilePath("meta.dng");
          const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
          console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
          const imageMetadata = await imageSourceObj!.readImageMetadata();
          console.info(TAG, testName, `readImageMetadata success`,imageMetadata);
          console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,dngMetadata,`,JSON.stringify(imageMetadata.dngMetadata));
          expect(imageMetadata.dngMetadata!=undefined).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
  
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0100
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0100
       * @tc.desc      createPictureAtIndex cover normal paramater
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0100', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0100";
        let filePath = await getFilePath("test6.gif");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        let frameCount: undefined | int = await imageSourceObj!.getFrameCount();
        for (let index = 0; index < frameCount; index++) {
          try {
            let pictureObj: image.Picture | undefined = await imageSourceObj?.createPictureAtIndex(index);
            console.info(TAG, testName,'Create picture succeeded for frame: ' + pictureObj);
            expect(pictureObj!=undefined).assertTrue();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          }
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0200
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0200
       * @tc.desc      createPictureAtIndex(-1)  .png cover  7700102
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0200', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0200";
        let filePath = await getFd("test.png");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        let frameCount: int = await imageSourceObj!.getFrameCount();
        console.info(TAG, testName,'getFrameCount succeeded for frame',frameCount);
        for (let index = -1; index < frameCount; index++) {
          try {
            let pictureObj: image.Picture | undefined = await imageSourceObj!.createPictureAtIndex(-1);
            console.info(TAG, testName,'Create picture succeeded for frame: ' + pictureObj);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect(error.code).assertEqual(7700102);
          }
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0300
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0300
       * @tc.desc      createPictureAtIndex:-1, .jpg cover abnormal paramater, 7700102
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0300', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0300";
        let filePath = await getFd("test_exif_v2.jpg");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        let frameCount: int = await imageSourceObj!.getFrameCount();
        console.info(TAG, testName,'getFrameCount succeeded for frame',frameCount);
        for (let index = -1; index < frameCount; index++) {
          try {
            let pictureObj: image.Picture | undefined = await imageSourceObj!.createPictureAtIndex(index);
            console.info(TAG, testName,'Create picture succeeded for frame: ' + pictureObj);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect(error.code).assertEqual(7700102);
          }
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0400
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0400
       * @tc.desc      createPictureAtIndex(0) cover .jpg 7700102
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0400', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0400";
        let filePath = await getFd("test_exif_v2.jpg");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        let frameCount: int = await imageSourceObj!.getFrameCount();
        for (let index = 0; index < frameCount; index++) {
          try {
            let pictureObj: image.Picture | undefined = await imageSourceObj!.createPictureAtIndex(index);
            console.info(TAG, testName,'Create picture succeeded for frame: ' + pictureObj);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect(error.code).assertEqual(7700102);
          }
        }
        done();
      })
      /**
       * @tc.number    SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0500
       * @tc.name      SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0500
       * @tc.desc      createPictureAtIndex(0) cover test.png 7700102
       * @tc.size      MEDIUM
       * @tc.type      Function
       * @tc.level     Level 1
       */
      it('SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0500', Level.LEVEL1, async (done: () => void) => {
        const testName = "SUB_MEDIA_IMAGE_SOURCE_createPictureAtIndex_STATIC_0500";
        let filePath = await getFd("test.png");
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
        console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
        let frameCount: int = await imageSourceObj!.getFrameCount();
        for (let index = 0; index < frameCount; index++) {
          try {
            let pictureObj: image.Picture | undefined = await imageSourceObj!.createPictureAtIndex(index);
            console.info(TAG, testName,'Create picture succeeded for frame: ' + pictureObj);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
            expect(error.code).assertEqual(7700102);
          }
        }
        done();
      })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0100
     * @tc.desc      createThumbnailSync cover generateThumbnailIfAbsent: true,
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0100";
      let filePath = await getFd("jpeg_exif_thumbnail.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
      try{
        const imageInfo = await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG, testName,`CreateThumbnailSync: Unsupported MIME type: ${imageInfo!.mimeType}`);
          return undefined;
        }
        const decodingOptionsForThumbnail: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: true,
          maxGeneratedPixelDimension: 200,
        };
        const pixelmap = imageSourceObj!.createThumbnailSync(decodingOptionsForThumbnail);
        console.info(TAG, testName,'Succeeded in creating thumbnail pixelMap object.',pixelmap);
        expect(pixelmap!=undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0200
     * @tc.desc      createThumbnailSync cover generateThumbnailIfAbsent: false,
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0200";
      let filePath = await getFd("jpeg_exif_thumbnail.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
      try{
        const imageInfo = await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG, testName,`CreateThumbnailSync: Unsupported MIME type: ${imageInfo!.mimeType}`);
          return undefined;
        }
        const decodingOptionsForThumbnail: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: false,
          maxGeneratedPixelDimension: 200,
        };
        const pixelmap = imageSourceObj!.createThumbnailSync(decodingOptionsForThumbnail);
        console.info(TAG, testName,'Succeeded in creating thumbnail pixelMap object.',pixelmap);
        expect(pixelmap!=undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_1300
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_1300
     * @tc.desc      createThumbnailSync cover no  generateThumbnailIfAbsent
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_1300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_1300";
      let filePath = await getFd("jpeg_exif_thumbnail.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
      try{
        const imageInfo = await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG, testName,`CreateThumbnailSync: Unsupported MIME type: ${imageInfo!.mimeType}`);
          return undefined;
        }
        const decodingOptionsForThumbnail: image.DecodingOptionsForThumbnail = {
          maxGeneratedPixelDimension: 200,
        };
        const pixelmap = imageSourceObj!.createThumbnailSync(decodingOptionsForThumbnail);
        console.info(TAG, testName,'Succeeded in creating thumbnail pixelMap object.',pixelmap);
        expect(pixelmap!=undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_2300
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_2300
     * @tc.desc      createThumbnailSync cover no maxGeneratedPixelDimension
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_2300', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_2300";
      let filePath = await getFd("jpeg_exif_thumbnail.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
      try{
        const imageInfo = await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG, testName,`CreateThumbnailSync: Unsupported MIME type: ${imageInfo!.mimeType}`);
          return undefined;
        }
        const decodingOptionsForThumbnail: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: false,
        };
        const pixelmap = imageSourceObj!.createThumbnailSync(decodingOptionsForThumbnail);
        console.info(TAG, testName,'Succeeded in creating thumbnail pixelMap object.',pixelmap);
        expect(pixelmap!=undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0400
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0400
     * @tc.desc      createThumbnailSync cover errorSource:.gif,errorCode:7700102
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0400";
      let filePath = await getFd("moving_test_loop0.gif");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
      try{
        const imageInfo = await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG, testName,`CreateThumbnailSync: Unsupported MIME type: ${imageInfo!.mimeType}`);
        }
        const pixelmap = imageSourceObj!.createThumbnailSync();
        console.info(TAG, testName,'Succeeded in creating thumbnail pixelMap object.',pixelmap);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700102);
      }
      await imageSourceObj!.release();
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0500
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0500
     * @tc.desc      createThumbnailSync cover .heic,
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0500";
      let filePath = await getFd("test_exif_v4.heic");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
      try{
        if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
          console.info(TAG,testName, "device is not support heif encode");
          await imageSourceObj!.release();
          done();
        } else {
        const imageInfo = await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG, testName,`CreateThumbnailSync: Unsupported MIME type: ${imageInfo!.mimeType}`);
          await imageSourceObj!.release();
          done();
          return;
        }
          const pixelmap = imageSourceObj!.createThumbnailSync();
          console.info(TAG, testName, 'Succeeded in creating thumbnail pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0600
     * @tc.name      SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0600
     * @tc.desc      createThumbnailSync cover generateThumbnailIfAbsent: false,
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_SOURCE_CreateThumbnailSync_STATIC_0600";
      let filePath = await getFd("jpeg_exif_thumbnail.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG, testName, `imageSourceObj success`, imageSourceObj!);
      try{
        const imageInfo = await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG, testName,`CreateThumbnailSync: Unsupported MIME type: ${imageInfo!.mimeType}`);
          return undefined;
        }
        const decodingOptionsForThumbnail: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: false,
          maxGeneratedPixelDimension: 200,
        };
        const pixelmap = imageSourceObj!.createThumbnailSync(decodingOptionsForThumbnail);
        console.info(TAG, testName,'Succeeded in creating thumbnail pixelMap object.',pixelmap);
        expect(pixelmap!=undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })

  })
}