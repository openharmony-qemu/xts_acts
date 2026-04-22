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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../hypium';
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

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata?.dngVersion));
        let dngVersion = JSON.stringify(metaData.dngMetadata?.dngVersion);
        expect(dngVersion).assertEqual("[1,4,0,0]");

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata?.dngBackwardVersion));
        let dngBackwardVersion = JSON.stringify(metaData.dngMetadata?.dngBackwardVersion);
        expect(dngBackwardVersion).assertEqual("[1,1,0,0]");

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`, JSON.stringify(metaData.dngMetadata?.uniqueCameraModel));
        expect(metaData.dngMetadata?.uniqueCameraModel).assertEqual('CLS-AL00-HUAWEI-HUAWEI');

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.cfaPlaneColor`, metaData.dngMetadata?.cfaPlaneColor);
        let cfaPlaneColor = JSON.stringify(metaData.dngMetadata?.cfaPlaneColor);
        expect(cfaPlaneColor).assertEqual("[0,1,2]");

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.cfaLayout`, metaData.dngMetadata?.cfaLayout);
        let cfaLayout = JSON.stringify(metaData.dngMetadata?.cfaLayout);
        expect(cfaLayout).assertEqual("1");

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.linearizationTable`, metaData.dngMetadata?.linearizationTable);

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.blackLevelRepeatDim`, metaData.dngMetadata?.blackLevelRepeatDim);
        let blackLevelRepeatDim = JSON.stringify(metaData.dngMetadata?.blackLevelRepeatDim);
        expect(blackLevelRepeatDim).assertEqual("[2,2]");

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.blackLevel`, metaData.dngMetadata?.blackLevel);
        let blackLevel = JSON.stringify(metaData.dngMetadata?.blackLevel);
        expect(blackLevel).assertEqual("[256,256,256,256]");

        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.lensInfo`, metaData.dngMetadata?.blackLevelDeltaH);
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.lensInfo`, metaData.dngMetadata?.blackLevelDeltaV);
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success,metaData.dngMetadata?.lensInfo`, metaData.dngMetadata?.whiteLevel);
        let whiteLevel = JSON.stringify(metaData.dngMetadata?.whiteLevel);
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
        console.info(TAG, testName, `imageSourceObj readImageMetadataByType success`,metaData.webPMetadata,);
        expect(metaData.webPMetadata!=undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })


  })
}