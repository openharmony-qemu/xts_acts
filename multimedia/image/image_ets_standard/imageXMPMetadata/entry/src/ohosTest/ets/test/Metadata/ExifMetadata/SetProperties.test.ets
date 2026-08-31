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
import {CUVAHdrExpectedValue, CUVAHdrMultiExpectedValue, testExifExpectedValue, verifyExifPropertiesByMetadata1, convert} from '../ImageProperties.test'

const TAG = 'setProperties';
 
async function setPropertiesPromiseTest(done: Function, testName: string, path: string,
  setkey: Map<image.PropertyKey, string | null>, repeat: number) {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
        sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let imageMetadata: image.ImageMetadata = await imageSource.readImageMetadata();

    let exifMetadata = imageMetadata.exifMetadata;

    if (exifMetadata != null) {
        for(let i = 0; i < repeat; i++){
            let record = await convert(setkey);
            await exifMetadata.setProperties(record);
            const allKeys: image.PropertyKey[] = Object.keys(record) as image.PropertyKey[];
            let result = await verifyExifPropertiesByMetadata1(exifMetadata, allKeys, record);
            expect(result).assertTrue();
        }
    }
    done();
}
 
async function setPropertiesAbnormalPromiseTest(done: Function, testName: string, path: string,
  setkey?: ESObject): Promise<boolean> {
  let result = true;
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let imageMetadata: image.ImageMetadata = await imageSource.readImageMetadata();

    let exifMetadata = imageMetadata.exifMetadata;

    if (exifMetadata != null) {
      await exifMetadata.setProperties(setkey);
      result = false;
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == 7600202 || error.code == 401).assertTrue();
  }
  return result;
}
 
export default function ExifSetPropertiesTest() {
  describe('ExifSetPropertiesTest', () => {
 
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0001
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0001', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0001';
        try{
            const path = 'CUVAHdr.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = "300";
            setkey[image.PropertyKey.IMAGE_LENGTH] = "300";
            await setPropertiesPromiseTest(done, testName, path, setkey, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0002
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0002', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0002';
        try{
            const path = 'CUVAHdrMulti.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = "1000";
            setkey[image.PropertyKey.IMAGE_LENGTH] = "1000";
            await setPropertiesPromiseTest(done, testName, path, setkey, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0003
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0003', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0003';
        try{
            const path = 'CUVAHdrMulti.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = "0";
            setkey[image.PropertyKey.IMAGE_LENGTH] = "1000";
            await setPropertiesPromiseTest(done, testName, path, setkey, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0004
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0004', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0004';
        try{
            const path = 'CUVAHdrMulti.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = "1000";
            setkey[image.PropertyKey.IMAGE_LENGTH] = "0";
            await setPropertiesPromiseTest(done, testName, path, setkey, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0005
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0005
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0005', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0005';
        try{
            const path = 'CUVAHdrMulti.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = "0";
            setkey[image.PropertyKey.IMAGE_LENGTH] = "0";
            await setPropertiesPromiseTest(done, testName, path, setkey, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0006
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0006
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0006', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0006';
        try{
            const path = 'test_exif.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = "200";
            setkey[image.PropertyKey.IMAGE_LENGTH] = "300";
            await setPropertiesPromiseTest(done, testName, path, setkey, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0007
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0007
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0007', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0007';
        try{
            const path = 'test_exif.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            await setPropertiesPromiseTest(done, testName, path, setkey, 1);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0008
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0008
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0008', Level.LEVEL0, async (done: Function) => {
            const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_0008';
        try{
            const path = 'test_exif.jpg';
            let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = "200";
            setkey[image.PropertyKey.IMAGE_LENGTH] = "300";
            await setPropertiesPromiseTest(done, testName, path, setkey, 100);
        } catch (error) {
            console.info(TAG, `failed; error: ${error},${error.code}`, testName);
            expect().assertFail();
            done();
        }
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0001
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0001';
        const path = 'CUVAHdrMulti.jpg';
        let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = '300';
            setkey[image.PropertyKey.IMAGE_LENGTH] = null;
        let result = await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
        expect(result).assertTrue();
        done();
      })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0002
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0002', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0002';
        const path = 'CUVAHdrMulti.jpg';
        let setkey: Map<image.PropertyKey, string | null> = new Map();
            setkey[image.PropertyKey.IMAGE_WIDTH] = null;
            setkey[image.PropertyKey.IMAGE_LENGTH] = '600';
        let result = await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
        expect(result).assertTrue();
        done();
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0003
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0003', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0003';
        const path = 'CUVAHdrMulti.jpg';
        let setkey: Map<image.PropertyKey, string | null> = new Map();
        setkey[image.PropertyKey.IMAGE_WIDTH] = null;
        setkey[image.PropertyKey.IMAGE_LENGTH] = null;
        let result = await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
        expect(result).assertTrue();
        done();
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0004
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0004', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0004';
        const path = 'CUVAHdrMulti.jpg';
        let setkey: Map<image.PropertyKey, string | null> = new Map();
        setkey[image.PropertyKey.IMAGE_WIDTH] = null;
        setkey[image.PropertyKey.IMAGE_LENGTH] = null;
        let result = await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
        expect(result).assertTrue();
        done();
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0005
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0005
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0005', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0005';
        const path = 'CUVAHdrMulti.jpg';
        let setkey = null;
        let result = await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
        expect(result).assertTrue();
        done();
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0006
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0006
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0006', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0006';
        const path = 'CUVAHdrMulti.jpg';
        let setkey = undefined;
        let result = await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
        expect(result).assertTrue();
        done();
    })
 
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0007
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0007
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0007', Level.LEVEL0, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_EXIF_METADATA_SETPROPERTIES_ERROR_TEST_0007';
        const path = 'CUVAHdr.jpg';
        let setkey: Map<image.PropertyKey, string | null> = new Map();
        setkey["ImageWidth11"] = "300";
        setkey["ImageLength11"] = "300";
        let result = await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
        expect(result).assertTrue();
        done();
    })
 
  })
}
