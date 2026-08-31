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
 
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { allPropertyKeys, CUVAHdrExpectedValue, CUVAHdrMultiExpectedValue, testExifExpectedValue, verifyExifPropertiesByMetadata } from '../ImageProperties.test'
 
const TAG = 'getAllProperties';
 
async function getAllPropertiesPromiseTest(done: Function, testName: string, path: string, repeat: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const resourceMgr = testContext.resourceManager;
  const rawFile = await resourceMgr.getRawFileContent(path);
  let ops: image.SourceOptions = {
    sourceDensity: 98,
  }
  let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
  let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
  let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
  let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
  let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
  if (metaData != null) {
      for(let i = 0; i < repeat; i++){
          let result: boolean;
          if(path === "CUVAHdr.jpg"){
          result = await verifyExifPropertiesByMetadata(metaData, allPropertyKeys, CUVAHdrExpectedValue, path, "metadata getAllPropertiesPromiseTest");
          } else if (path === 'CUVAHdrMulti.jpg'){
          result = await verifyExifPropertiesByMetadata(metaData, allPropertyKeys, CUVAHdrMultiExpectedValue, path, "metadata getAllPropertiesPromiseTest");
          } else {
          result = await verifyExifPropertiesByMetadata(metaData, allPropertyKeys, testExifExpectedValue, path, "metadata getAllPropertiesPromiseTest");
          }
          console.info(TAG, `expect result: ${result}`);
          expect(result).assertTrue();
      }
  }
  done();
} 
 
export default function GetAllPropertiesTest() {
  describe('GetAllPropertiesTest', () => {
 
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0001
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0001', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0001';
        try{
            const path = 'CUVAHdr.jpg';
            await getAllPropertiesPromiseTest(done, testName, path, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0002
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0002', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0002';
        try{
            const path = 'CUVAHdrMulti.jpg';
            await getAllPropertiesPromiseTest(done, testName, path, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0003
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0003', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0003';
        try {
            const path = 'test_exif.jpg';
            await getAllPropertiesPromiseTest(done, testName, path, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0004
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0004', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_ALL_PROPERTIES_0004';
        try {
            const path = 'test_exif.jpg';
            await getAllPropertiesPromiseTest(done, testName, path, 100);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
 
  })
}