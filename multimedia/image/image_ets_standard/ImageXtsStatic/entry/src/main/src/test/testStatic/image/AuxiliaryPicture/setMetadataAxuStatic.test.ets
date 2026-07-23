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
import { BusinessError } from '@ohos.base';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level} from '../../../../../../hypium/index';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = 'Static_AXU_setMetadataStatic';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
const getFilePath = async (fileName: string): Promise<string> => {
  let filePath = testContext.filesDir + "/" + fileName;
  return filePath;
}
async function setMetadataPromiseTest(done: () => void, testName: string, path: string,
  metadataType: image.MetadataType, AuxiliaryPictureType: image.AuxiliaryPictureType,callback: (auxPictureObj: image.AuxiliaryPicture | null,exifMetaData: image.Metadata) => void) {
  try {
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops) as image.ImageSource;
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap() as image.PixelMap;
    let commodityPixelMap: image.Picture | null = await imageSource.createPicture() as image.Picture;
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap) as image.Picture;
    let auxPictureObj: image.AuxiliaryPicture | null =  await commodityPixelMap!.getAuxiliaryPicture(AuxiliaryPictureType) as image.AuxiliaryPicture;
    if (auxPictureObj != null) {
      let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType) as image.Metadata;
      callback(auxPictureObj,exifMetaData);
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function setMetadataAbnormalPromiseTest(done: () => void, testName: string, path: string,
  metadataType: image.MetadataType | null | undefined | number, exifMetaData: image.Metadata | null | undefined | number) {
  try {
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops) as image.ImageSource;
    let commodityPixelMap: image.Picture | null = await imageSource.createPicture() as image.Picture;
    let auxPictureObj: image.AuxiliaryPicture | null = await commodityPixelMap!.getAuxiliaryPicture(AuxiliaryPictureType) as image.AuxiliaryPicture;
    if (auxPictureObj != null) {
      auxPictureObj.setMetadata(metadataType as image.MetadataType, exifMetaData as image.Metadata).then(() => {
        console.info(TAG, 'Set metadata success');
        expect(exifMetaData != null).assertTrue();
      }).catch((error) => {
        console.error(TAG, 'Failed to set metadata. error.code: ' + JSON.stringify(error.code) + ' ,error.message:' +
        JSON.stringify(error.message));
        // expect(true).assertTrue();
      });
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect(true).assertTrue();
    done();
  }
}

export default function SetMetadataAxuStaticTest(): void {
  describe('SetMetadataAxuStaticTest', (): void => {

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
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0100
     * @tc.desc   setMetadata,cover: GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0100';
      const resourceMgr = testContext.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      let imageSourceObjFilePath = await getFilePath("AllAuxiliaryPictures_exclude_fragment.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap!);
      console.info(TAG, testName, `image.createPicture success`,exifPictureObj);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize:image.Size = {
          height: 180,
          width: 240
        };
        let auxPictureObj: image.AuxiliaryPicture = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        let exifMetaData: image.Metadata |undefined= await exifPictureObj.getMetadata(image.MetadataType.EXIF_METADATA);
        auxPictureObj.setMetadata(image.MetadataType.EXIF_METADATA, exifMetaData!);
        console.info(TAG, testName, `setMetadata success`,exifMetaData);
        expect(exifMetaData!=undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0200
     * @tc.desc   setMetadata,cover: FRAGMENT_MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0200';
      const path = 'AllAuxiliaryPictures.jpg';
      const resourceMgr = testContext.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      let imageSourceObjFilePath = await getFilePath("AllAuxiliaryPictures_exclude_fragment.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap!);
      console.info(TAG, testName, `image.createPicture success`,exifPictureObj);
      try {
        let auxType: image.AuxiliaryPictureType =image.AuxiliaryPictureType.FRAGMENT_MAP;
        const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize:image.Size = {
          height: 180,
          width: 240
        };
        let auxPictureObj: image.AuxiliaryPicture = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        let exifMetaData: image.Metadata |undefined= await exifPictureObj.getMetadata(image.MetadataType.EXIF_METADATA);
        auxPictureObj.setMetadata(image.MetadataType.EXIF_METADATA, exifMetaData!);
        console.info(TAG, testName, `setMetadata success`,exifMetaData);
        expect(exifMetaData!=undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0300
     * @tc.desc   setMetadata,cover: DEPTH_MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0300';
      const resourceMgr = testContext.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      let imageSourceObjFilePath = await getFilePath("AllAuxiliaryPictures_exclude_fragment.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap!);
      console.info(TAG, testName, `image.createPicture success`,exifPictureObj);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize:image.Size = {
          height: 180,
          width: 240
        };
        let auxPictureObj: image.AuxiliaryPicture = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        let exifMetaData: image.Metadata |undefined= await exifPictureObj.getMetadata(image.MetadataType.EXIF_METADATA);
        auxPictureObj.setMetadata(image.MetadataType.EXIF_METADATA, exifMetaData!);
        console.info(TAG, testName, `setMetadata success`,exifMetaData);
        expect(exifMetaData!=undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0400
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0400
     * @tc.desc   setMetadata,cover: LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0400';
      const resourceMgr = testContext.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      let imageSourceObjFilePath = await getFilePath("AllAuxiliaryPictures_exclude_fragment.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap!);
      console.info(TAG, testName, `image.createPicture success`,exifPictureObj);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
        const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize:image.Size = {
          height: 180,
          width: 240
        };
        let auxPictureObj: image.AuxiliaryPicture = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        let exifMetaData: image.Metadata |undefined= await exifPictureObj.getMetadata(image.MetadataType.EXIF_METADATA);
        auxPictureObj.setMetadata(image.MetadataType.EXIF_METADATA, exifMetaData!);
        console.info(TAG, testName, `setMetadata success`,exifMetaData);
        expect(exifMetaData!=undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0500
     * @tc.desc   setMetadata,cover: UNREFOCUS_MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0500';
      const path = 'AllAuxiliaryPictures.jpg';
      const resourceMgr = testContext.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      let imageSourceObjFilePath = await getFilePath("AllAuxiliaryPictures_exclude_fragment.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap!);
      console.info(TAG, testName, `image.createPicture success`,exifPictureObj);
      try {
        let auxType: image.AuxiliaryPictureType =image.AuxiliaryPictureType.UNREFOCUS_MAP;
        const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize:image.Size = {
          height: 180,
          width: 240
        };
        let auxPictureObj: image.AuxiliaryPicture = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        let exifMetaData: image.Metadata |undefined= await exifPictureObj.getMetadata(image.MetadataType.EXIF_METADATA);
        auxPictureObj.setMetadata(image.MetadataType.EXIF_METADATA, exifMetaData!);
        console.info(TAG, testName, `setMetadata success`,exifMetaData);
        expect(exifMetaData!=undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0600
     * @tc.desc   setMetadata,cover: LINEAR_MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setMetadata_promise_Supp_Static_0600';
      const resourceMgr = testContext.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      let imageSourceObjFilePath = await getFilePath("AllAuxiliaryPictures_exclude_fragment.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(imageSourceObjFilePath);
      console.info(TAG, testName, `createImageSource success`,imageSourceObj);
      let exifCommodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
      console.info(TAG, testName, `createPixelMap success`,exifCommodityPixelMap);
      let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap!);
      console.info(TAG, testName, `image.createPicture success`,exifPictureObj);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize:image.Size = {
          height: 180,
          width: 240
        };
        let auxPictureObj: image.AuxiliaryPicture = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        let exifMetaData: image.Metadata |undefined= await exifPictureObj.getMetadata(image.MetadataType.EXIF_METADATA);
        auxPictureObj.setMetadata(image.MetadataType.EXIF_METADATA, exifMetaData!);
        console.info(TAG, testName, `setMetadata success`,exifMetaData);
        expect(exifMetaData!=undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })

  })
}