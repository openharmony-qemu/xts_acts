/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import resourceManager from '@ohos.resourceManager';
import { 
  ReadOnlyMetaDataRule,
  dngMetadataMap,
  webpMetadataMap
} from './ImagePropertyByType.test'

interface ModifyRule1 {
  key?: string;
  oldExpectValue: string | null | undefined;
  newExpectValue: string | number | Array<number> | ArrayBuffer | boolean | undefined;
}

interface ModifyRule {
  key?: string;
  modifyValue: string;
  oldExpectValue: string;
  newExpectValue: string | number | Array<number> | boolean;
}

interface GenericError {
  code?: number;
  message?: string;
}

interface EnumValuePair<T> {
  enum: T;
  value: number;
}

let cacheDir: string | undefined;
let isSupportHEIFDecode: boolean;
let isSupportHdr: boolean;
const READ_FAILED = 7700202;
const UNSUPPORTED_IMAGE_FORMATS = 7700102;
const PROPERTY_NOT_EXIST = 7700204;
const INVALID_PARAMETER = 7600206;
type MetadataScalar = string | number | number[] | ESObject | undefined | null | boolean;

function handleError(testTag: string, err: GenericError | Array<GenericError>, expectedErrorCode: number): boolean {
  if (Array.isArray(err)) {
    for (let error of err) {
      console.error(`${testTag} failed.err: ${error.code} errorMessage: ${error.message}`);
      return error.code == expectedErrorCode;
    }
  } else {
    let error: GenericError = err;
    console.error(`${testTag} failed.err: ${error.code} errorMessage: ${error.message}`);
    return error.code == expectedErrorCode;
  }
  return false;
}

export default function imageExifGetModifyByTypeTest(): void {
  describe("imageExifGetModifyByTypeTest", () => {

    beforeAll(async () => {
      cacheDir = AppStorage.get('cacheDir')
      let filePath: string = AppStorage.get('pathDir') + '/' + "test.jpg";
      let imageSource: image.ImageSource = image.createImageSource(filePath);
      console.info('imageSource is ' + imageSource);
      isSupportHEIFDecode = imageSource.supportedFormats.includes('image/heic');
      console.info('isSupportHEIFDecode is ' + isSupportHEIFDecode);
      isSupportHdr =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });

    let filePath: string;
    let fdNumber: number;
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;

    const getFd = async (fileName: string): Promise<void> => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fdNumber = file.fd;
    }

    const getBuffer = async (fileName: string): Promise<ArrayBuffer> => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize: number = stats.size;
      const bufferRead = new ArrayBuffer(fileSize);
      fs.readSync(file.fd, bufferRead);
      return bufferRead;
    }

    const getImageSource = async(fileName: string, type: string): Promise<image.ImageSource> => {
      let imageSourceApi: image.ImageSource;
      if(type === "buffer"){
        const buffer = await getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      }else if(type === "uri"){
        const filePath: string = AppStorage.get('pathDir') + '/' + fileName;
        imageSourceApi = image.createImageSource(filePath);
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager;
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName);
        imageSourceApi = image.createImageSource(rawFileDescriptor);
      }else if(type === "incremental") {
        const picBuffer = await getBuffer(fileName);
        imageSourceApi = image.CreateIncrementalSource(picBuffer);
      }else{
        await getFd(fileName);
        imageSourceApi = image.createImageSource(fdNumber);
        fs.closeSync(fdNumber);
      }
      return imageSourceApi;
    }

    const compareValues = (
      actual: string | number | ESObject | number[] | undefined | null | boolean,
      expected: string | number | ESObject | number[] | undefined | null | boolean
    ): boolean => {
      if (Array.isArray(actual) && Array.isArray(expected)) {
        if (actual.length !== expected.length) return false;
        return actual.every((val: number, index: number) => val == expected[index]);
      }
      return actual === expected;
    }

    const compareArrayBuffer = (
      actualBuffer: ArrayBuffer,
      expectedValue: string | number | ESObject | number[] | undefined | null | ArrayBuffer | boolean
    ): boolean => {
      const actualArray = new Uint8Array(actualBuffer);
      const MAX_COMPARE_COUNT = 20;
      
      const logCount = Math.min(MAX_COMPARE_COUNT, actualArray.length);
      for (let i = 0; i < logCount; i++) {
        console.info(`ArrayBuffer[${i}]: ${actualArray[i]}`);
      }
      if (actualArray.length > MAX_COMPARE_COUNT) {
        console.info(`ArrayBuffer: ... (${actualArray.length - MAX_COMPARE_COUNT} elements omitted) ...`);
      }

      if (expectedValue instanceof ArrayBuffer) {
        const expectedArray = new Uint8Array(expectedValue);
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expectedArray.length);
        
        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expectedArray[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expectedArray[i]}`);
            return false;
          }
        }
        return true;
      }
      
      if (Array.isArray(expectedValue)) {
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expectedValue.length);
        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expectedValue[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expectedValue[i]}`);
            return false;
          }
        }
        return true;
      }
      return false;
    }

    const verifyMetadataProperties = async (
      testNum: string,
      fileName: string,
      type: string,
      typeMetadata: string,
      exifMetadataKey: string[],
      rulesMap: Map<string, ModifyRule | ModifyRule1 | ReadOnlyMetaDataRule>
    ): Promise<boolean> => {
      let ret: boolean = true;
      const imageSourceApiGet = await getImageSource(fileName, type);
      const exifValue: image.ImageMetadata = await imageSourceApiGet.readImageMetadata(exifMetadataKey);
      for (let i = 0; i < exifMetadataKey.length; i++) {
        const rule = rulesMap.get(exifMetadataKey[i]);
        if (!rule) {
          console.info(`${testNum} No rule found for key: ${exifMetadataKey[i]}`);
          continue;
        }
        try {
          let expectedValue = rule.newExpectValue;
          if (exifValue[typeMetadata] == undefined) {
            await imageSourceApiGet?.release();
            console.info(`${testNum} Not meeting the conditions.`);
            return false;
            }
          let actualValue: string | number | ESObject | number[] | undefined | null | ArrayBuffer = exifValue[typeMetadata]![rule.key!];
          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testNum} Verification failed for ArrayBuffer key: ${exifMetadataKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testNum} Verification failed for key: ${exifMetadataKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testNum} Error processing key ${exifMetadataKey[i]}: ${error}`);
          ret = false;
        } finally {
          await imageSourceApiGet?.release();
        }
      }
      return ret;
    }

    const verifyMultipleFramesMetadata = <k>(
      testTag: string,
      exifValue: image.ImageMetadata,
      keys: k[],
      expectedIndex: number,
      rulesMap: Map<k, ReadOnlyMetaDataRule>,
      metadataType: string
    ): boolean => {
      let result: boolean = true;
      if (exifValue[metadataType] == undefined) {
        console.info(`${testTag} Not meeting the conditions.`);
        return false;
      }
      for (let i = 0; i < keys.length; i++) {
        const key = keys[i];
        const rule = rulesMap.get(key);
        if (!rule) {
          console.info(`${result} No rule found for key: ${key}`);
          continue;
        }
        try {
          let ruleExpectedValue = rule.newExpectValue;
          let expectedValue: MetadataScalar = Array.isArray(ruleExpectedValue) ? ruleExpectedValue[expectedIndex] : ruleExpectedValue;
          let actualValue: MetadataScalar = exifValue[metadataType]![rule.key!];
          if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            result = false;
          }
        } catch (error) {
          console.error(`${testTag} Error processing key ${key}: ${error}`);
          result = false;
        }
      }
      return result;
    }

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100
     * @tc.desc        Verify create image raw data from DNG file and create pixel map from raw data
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Create image raw data using createImage
     *                 3.Create new image source from raw data buffer
     *                 4.Create pixel map from new image source
     *                 5.Verify pixel map is created successfully with valid dimensions
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const dngMetadata = await imageSourceApi.createImageRawData();
        console.info(`${testTag} Created image raw data for DNG file, dngMetadata: ${JSON.stringify(dngMetadata)}`
                      + ` buffer length = ${dngMetadata.buffer.byteLength},`
                      + ` bitsPerPixel = ${dngMetadata.bitsPerPixel}`);
        let dngMetadataArray = new Uint16Array(dngMetadata.buffer);
        console.info(`${testTag} dngMetadataArray length = ${dngMetadataArray.length}`);
        const actualNumberArray = Array.from(dngMetadataArray).slice(0, 10);
        let exceptNumberArray: number[] = [0, 0, 32, 512, 4, 64, 0, 6150, 0, 512];
        let ret = compareValues(actualNumberArray, exceptNumberArray);
        expect(ret).assertTrue();
        console.info(`${testTag} dngMetadataArray data match expected values.`);
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100
     * @tc.desc        Verify create image raw data from DNG file and create pixel map from raw data
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Create image raw data using createImageRawData
     *                 3.Create new image source from raw data buffer
     *                 4.Create pixel map from new image source
     *                 5.Verify pixel map is created successfully with valid dimensions
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100";
      try {
        const imageSourceApi = await getImageSource("fake.dng", "uri");
        console.info(`${testTag} Created image source for fake.dng file.`);
        const dngMetadata = await imageSourceApi.createImageRawData();
        console.info(`${testTag} Created image raw data for fake.dng file, expected to fail.`);
        expect().assertFail();
      } catch (err) {
        console.error(`${testTag} Error: code: ${err.code}, message: ${err.message}`);
        expect(err.code == 7700101).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200
     * @tc.desc        Verify create image raw data from ico file
     *                 1.Create image source from ico file (test.ico) using uri
     *                 2.Create image raw data using createImageRawData
     *                 3.Verify createImageRawData fails with expected error
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200";
      try {
        const imageSourceApi = await getImageSource("test.ico", "uri");
        console.info(`${testTag} Created image source for ico file.`);
        const dngMetadata = await imageSourceApi.createImageRawData();
        console.info(`${testTag} Created image raw data for ico file, expected to fail.`);
        expect().assertFail();
      } catch (err) {
        console.error(`${testTag} Error: code: ${err.code}, message: ${err.message}`);
        expect(err.code == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadata
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100";
      try {
        let keys: string[] = Object.values(image.DngPropertyKey);
        console.info(`${testTag} DNG metadata keys to read: ${keys}`);
        const ret = await verifyMetadataProperties(testTag, "test_fake.dng", "uri", "dngMetadata", keys, dngMetadataMap);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadata
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi.readImageMetadata();
        console.info(`${testTag} Read DNG image metadataObj: ${imageMetadata.dngMetadata != undefined}`);
        console.info(`${testTag} DNG image rawDataUniqueID: ${imageMetadata.dngMetadata?.rawDataUniqueID}`);
        expect(imageMetadata.dngMetadata?.rawDataUniqueID == "CE70B9D6BAA1207B3ABBA6C9FFF84924").assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file using uri
     *                 2.Read DNG metadata using readImageMetadata
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100";
      try {
        const imageSourceApi = await getImageSource("HW_CAMERA.dng", "uri");
        const keys: string[] = ["LocalizedCameraModel", "BlackLevelDeltaH"];
        const imageMetadata = await imageSourceApi.readImageMetadata(keys);
        console.info(`${testTag} Read DNG image metadata: ${JSON.stringify(imageMetadata)}`);
        expect().assertFail();
      } catch (err) {
        let ret = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
        expect(ret).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadataByType
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.DNG_METADATA]);
        console.info(`${testTag} Read DNG image metadataObj: ${imageMetadata.dngMetadata != undefined}`);
        console.info(`${testTag} DNG image rawDataUniqueID: ${imageMetadata.dngMetadata?.rawDataUniqueID}`);
        expect(imageMetadata.dngMetadata?.rawDataUniqueID == "CE70B9D6BAA1207B3ABBA6C9FFF84924").assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadataByType with specific keys
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi.readImageMetadataByType();
        console.info(`${testTag} Read DNG image metadataObj: ${imageMetadata.dngMetadata != undefined}`);
        console.info(`${testTag} DNG image rawDataUniqueID: ${imageMetadata.dngMetadata?.rawDataUniqueID}`);
        expect(imageMetadata.dngMetadata?.rawDataUniqueID == "CE70B9D6BAA1207B3ABBA6C9FFF84924").assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100
     * @tc.desc        Verify WEBP metadata reading with default parameters
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
     *                 2.Read metadata using readImageMetadata()
     *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        result = verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, webpMetadataMap, "webPMetadata");
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200
     * @tc.desc        Verify WEBP metadata reading at a specified frame index
     *                 1.Create image source from WEBP file (loop_count_9.webp) using uri
     *                 2.Read metadata using readImageMetadata([], 2)
     *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 2
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata([], 2);
        result = verifyMultipleFramesMetadata(testTag, exifValue, keys, 2, webpMetadataMap, "webPMetadata");
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300
     * @tc.desc        Verify WEBP metadata reading across all frames
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
     *                 2.Get frame count and read metadata for each frame using readImageMetadata(keys, i)
     *                 3.Verify WEBP metadata values against webpMetadataMap for each frame index
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      try {
        for (let i = 0; i < frameCount; i++) {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, i);
          if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, i, webpMetadataMap, "webPMetadata")) {
            result = false;
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400
     * @tc.desc        Verify WEBP canvas size metadata with selected keys
     *                 1.Create image source from WEBP file (1.webp) using uri
     *                 2.Read metadata using readImageMetadata([CANVAS_WIDTH, CANVAS_HEIGHT], 0)
     *                 3.Verify canvasWidth equals 550 and canvasHeight equals 368
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = [image.WebPPropertyKey.CANVAS_WIDTH, image.WebPPropertyKey.CANVAS_HEIGHT];
      const imageSourceApi = await getImageSource("1.webp", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, 0);
        let canvasWidth: number | undefined = exifValue.webPMetadata!.canvasWidth;
        let canvasHeight: number | undefined = exifValue.webPMetadata!.canvasHeight;
        console.info(`${testTag} canvasWidth is: ${canvasWidth}, canvasHeight is: ${canvasHeight}`);
        if (canvasWidth == undefined || canvasHeight == undefined) {
          console.error(`${testTag} canvasWidth or canvasHeight is undefined`);
          result = false;
        } else {
          result = result && canvasWidth == 550 && canvasHeight == 368;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500
     * @tc.desc        Verify WEBP delay metadata relationship at a specified frame
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
     *                 2.Read metadata using readImageMetadata([DELAY_TIME, UNCLAMPED_DELAY_TIME], 1)
     *                 3.Verify delayTime equals unclampedDelayTime multiplied by 100
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = [image.WebPPropertyKey.DELAY_TIME, image.WebPPropertyKey.UNCLAMPED_DELAY_TIME];
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, 1);
        let delayTime: number | undefined = exifValue.webPMetadata!.delayTime;
        let unclampedDelayTime: number | undefined = exifValue.webPMetadata!.unclampedDelayTime;
        console.info(`${testTag} delayTime is: ${delayTime}, unclampedDelayTime is: ${unclampedDelayTime}`);
        if (delayTime == undefined || unclampedDelayTime == undefined) {
          console.error(`${testTag} delayTime or unclampedDelayTime is undefined`);
          result = false;
        } else {
          result = result && delayTime == unclampedDelayTime * 100;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600
     * @tc.desc        Verify readImageMetadata returns expected error for unsupported WEBP metadata keys
     *                 1.Create image source from WEBP file (1.webp) using uri
     *                 2.Read metadata using readImageMetadata([DELAY_TIME, UNCLAMPED_DELAY_TIME, LOOP_COUNT], 0)
     *                 3.Verify API throws READ_FAILED
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = [image.WebPPropertyKey.DELAY_TIME, image.WebPPropertyKey.UNCLAMPED_DELAY_TIME, image.WebPPropertyKey.LOOP_COUNT];
      const imageSourceApi = await getImageSource("1.webp", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, 0);
        console.error(`${testTag} Unsupported metadata exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100
     * @tc.desc        Verify WEBP metadata reading by type with default parameters
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
     *                 2.Read metadata using readImageMetadataByType()
     *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, webpMetadataMap, "webPMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200
     * @tc.desc        Verify WEBP metadata reading by type at a specified frame index
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
     *                 2.Read metadata using readImageMetadataByType([], 2)
     *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 2
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([], 2);
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 2, webpMetadataMap, "webPMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300
     * @tc.desc        Verify WEBP metadata-by-type reading across all frames
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
     *                 2.Get frame count and read metadata by type for each frame
     *                 3.Verify WEBP metadata values against webpMetadataMap for each frame index
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      try {
        for (let i = 0; i < frameCount; i++) {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.WEBP_METADATA], i);
          if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, i, webpMetadataMap, "webPMetadata")) {
            result = false;
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400
     * @tc.desc        Verify WEBP canvas size metadata by type
     *                 1.Create image source from WEBP file (1.webp) using fd
     *                 2.Read metadata using readImageMetadataByType([WEBP_METADATA], 0)
     *                 3.Verify canvasWidth equals 550 and canvasHeight equals 368
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("1.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.WEBP_METADATA], 0);
        let canvasWidth: number | undefined = exifValue.webPMetadata!.canvasWidth;
        let canvasHeight: number | undefined = exifValue.webPMetadata!.canvasHeight;
        console.info(`${testTag} canvasWidth is: ${canvasWidth}, canvasHeight is: ${canvasHeight}`);
        result = result && canvasWidth == 550 && canvasHeight == 368;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500
     * @tc.desc        Verify readImageMetadataByType returns expected error on non-WEBP source
     *                 1.Create image source from JPEG file (test_exif_v2.jpg) using uri
     *                 2.Read metadata using readImageMetadataByType([WEBP_METADATA], 0)
     *                 3.Verify API throws UNSUPPORTED_IMAGE_FORMATS
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.WEBP_METADATA], 0);
        console.error(`${testTag} Unsupported metadata exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = handleError(testTag, err as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100
     * @tc.desc        Verify WEBP frame delay list retrieval
     *                 1.Create image source from WEBP file (random_lossless.webp) using fd
     *                 2.Call getDelayTimeList()
     *                 3.Verify each frame delay equals 100
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("random_lossless.webp", "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      try {
        let delayTimes: Array<number> = await imageSourceApi.getDelayTimeList();
        for (let i = 0; i < frameCount; i++) {
          let exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata([], i);
          if (exifValue.webPMetadata != undefined && delayTimes[i] != undefined) {
            let delayTime: number | undefined = exifValue.webPMetadata!.delayTime;
            console.info(`${testTag} delayTime is: ${delayTime}`);
            result = result && delayTime == delayTimes[i];
          } else {
            console.error(`${testTag} getDelayTimeList get delayTime failed at frame index: ${i}`);
            result = false;
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} webp metadata getDelayTimePromise result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100
     * @tc.desc        Verify writeImageMetadata returns expected error for WEBP metadata writing
     *                 1.Create image source from WEBP file (random_lossless.webp) using uri
     *                 2.Build ImageMetadata with webPMetadata and call writeImageMetadata()
     *                 3.Verify API throws READ_FAILED
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("random_lossless.webp", "uri");
      let webpMetdata: image.WebPMetadata = {
        canvasWidth: 100,
        canvasHeight: 100,
        loopCount: 0,
        delayTime: 100,
        unclampedDelayTime: 100
      };
      const imageMetadata: image.ImageMetadata = {
        webPMetadata: webpMetdata
      };
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.error(`${testTag} Unsupported metadata webpMetdata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata writeImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100
     * @tc.desc        Verify EXIF and MakerNote metadata retrieval using getAllProperties
     *                 1.Create image source from JPEG file (test_exif_readWrite_jpg_v2.jpg) using fd
     *                 2.Read image metadata using readImageMetadata()
     *                 3.Call getAllProperties() for exifMetadata and makerNoteHuaweiMetadata
     *                 4.Verify ImageWidth and HwMnoteXmageMode match expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.exifMetadata != undefined && exifValue.makerNoteHuaweiMetadata != undefined) {
          let exifRecord: Record<string, string | null> = await exifValue.exifMetadata.getAllProperties();
          let makerNoteRecord: Record<string, string | null> = await exifValue.makerNoteHuaweiMetadata.getAllProperties();
          result = result && exifRecord["ImageWidth"] == "2000" && makerNoteRecord["HwMnoteXmageMode"] == "2";
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata getAllProperties result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

  });
}
