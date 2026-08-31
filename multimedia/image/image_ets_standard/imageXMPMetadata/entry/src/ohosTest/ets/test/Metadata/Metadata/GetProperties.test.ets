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

const TAG = 'getProperties';

async function getPropertiesPromiseTest(done: Function, testName: string, path: string,
  attributeKey: Array<image.PropertyKey> | null, repeat: number) {
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
        result = await verifyExifPropertiesByMetadata(metaData, attributeKey, CUVAHdrExpectedValue);
        } else if (path === 'CUVAHdrMulti.jpg'){
        result = await verifyExifPropertiesByMetadata(metaData, attributeKey, CUVAHdrMultiExpectedValue);
        } else {
        result = await verifyExifPropertiesByMetadata(metaData, attributeKey, testExifExpectedValue);
        }
        console.info(TAG, `expect result: ${result}`);
        expect(result).assertTrue();
      }
    }
    done();
}

async function getPropertiesAbnormalPromiseTest(done: Function, testName: string, path: string,
  attributeKey: ESObject): Promise<boolean> {
  let result = true;
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let pictureObj: image.Picture = await image.createPicture(commodityPixelMap);
    let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
    let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
    if (metaData != null) {
      let data = await metaData.getProperties(attributeKey);
      console.log(TAG, JSON.stringify(data));
      result = false;
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code === "7600202" || error.code === "401").assertTrue();
    } else {
      expect(error === "7600202" || error === "401").assertTrue();
    }
  }
  return result;
}

export default function GetPropertiesTest() {
  describe('GetPropertiesTest', () => {

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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0001
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0001', Level.LEVEL0, async (done: Function) => {
    const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0001';
      try{
        const path = 'CUVAHdr.jpg';
        let attributeKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
        await getPropertiesPromiseTest(done, testName, path, attributeKey, 1);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0002
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0002', Level.LEVEL0, async (done: Function) => {
    const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0002';
      try{
        const path = 'CUVAHdrMulti.jpg';
        let attributeKey = [image.PropertyKey.IMAGE_WIDTH];
        await getPropertiesPromiseTest(done, testName, path, attributeKey, 1);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0003
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0003', Level.LEVEL0, async (done: Function) => {
    const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0003';
      try{
        const path = 'test_exif.jpg';
        let attributeKey = [image.PropertyKey.IMAGE_LENGTH];
        await getPropertiesPromiseTest(done, testName, path, attributeKey, 1);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0004
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0004', Level.LEVEL0, async (done: Function) => {
    const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0004';
      try{
        const path = 'test_exif.jpg';
        await getPropertiesPromiseTest(done, testName, path, allPropertyKeys, 1);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0005
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0005
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_0005';
      try{
        const path = 'CUVAHdr.jpg';
        let attributeKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
        await getPropertiesPromiseTest(done, testName, path, attributeKey, 100);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0001
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0001';
      const path = 'test_exif.jpg';
      let attributeKey = null;
      let result = await getPropertiesAbnormalPromiseTest(done, testName, path, attributeKey);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0002
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0002';
      const path = 'test_exif.jpg';
      let attributeKey = undefined;
      let result = await getPropertiesAbnormalPromiseTest(done, testName, path, attributeKey);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0003
     * @tc.desc   getProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_METADATA_GET_PROPERTIES_ERROR_TEST_0003';
      const path = 'test_exif.jpg';
      let attributeKey = ['1111'];
      let result = await getPropertiesAbnormalPromiseTest(done, testName, path, attributeKey);
      expect(result).assertTrue();
      done();
    })
  })
}