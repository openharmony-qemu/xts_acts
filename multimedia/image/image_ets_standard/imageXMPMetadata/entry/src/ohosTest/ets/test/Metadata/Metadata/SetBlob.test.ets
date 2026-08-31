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
 
let isSupportHEIFDecode: boolean;
const PROPERTY_NOT_EXIST = 7700204;
const INVALID_PARAMETER = 7600206;
 
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
 
export default function SetBlobTest() {
  describe("SetBlobTest", () => {
 
    beforeAll(async () => {
      let filePath = AppStorage.get('pathDir') + '/' + "test.jpg";
      let imageSource: image.ImageSource = image.createImageSource(filePath);
      console.info('imageSource is ' + imageSource);
      isSupportHEIFDecode = imageSource.supportedFormats.includes('image/heic');
      console.info('isSupportHEIFDecode is ' + isSupportHEIFDecode);
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
    let fdNumber: number
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
 
    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fdNumber = file.fd
    }
 
    const getBuffer = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }
 
    const getImageSource = async(fileName:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "buffer"){
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        const filePath = AppStorage.get('pathDir') + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
      }else if(type === "incremental") {
        const picBuffer = await getBuffer(fileName)
        imageSourceApi = image.CreateIncrementalSource(picBuffer)
      }else{
        await getFd(fileName);
        imageSourceApi = image.createImageSource(fdNumber);
        fs.closeSync(fdNumber)
      }
      return imageSourceApi
    }
 
    const compareValues = (
      actual: string | number | object | number[] | undefined | null | boolean,
      expected: string | number | object | number[] | undefined | null | boolean
    ): boolean => {
      console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
      if (Array.isArray(actual) && Array.isArray(expected)) {
        console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
        if (actual.length !== expected.length) return false;
        console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
        return actual.every((val: number, index: number) => val == expected[index]);
      }
      console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
      return actual === expected;
    }
 
    const getMetadataFromPicture = async (
      imageSourceApi: image.ImageSource,
      index?: number | undefined
    ): Promise<image.Metadata> => {
      let picture: image.Picture;
      let metadata: image.Metadata;
      if (index !== undefined) {
        picture = await imageSourceApi.createPictureAtIndex(index);
        metadata = await picture.getMetadata(image.MetadataType.HEIFS_METADATA);
      } else {
        picture = await imageSourceApi.createPicture();
        metadata = await picture.getMetadata(image.MetadataType.EXIF_METADATA);
      }
      if (picture != undefined) {
        await picture?.release();
      }
      return metadata;
    }
 
    const testGetAndSetBlobArrayBuffer = async (
      testNum: string,
      sourceFileName: string,
      targetFileName: string,
      type: string,
      camelCaseMetadataKeys: Array<string>,
      index?: number | undefined
    ): Promise<boolean> => {
      let result = true;
      const imageSourceApi = await getImageSource(sourceFileName, type);
      let metadata: image.Metadata;
      if (index !== undefined) {
        metadata = await getMetadataFromPicture(imageSourceApi, index);
      } else {
        metadata = await getMetadataFromPicture(imageSourceApi);
      }
      try {
        let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
        console.info(`${testNum} getBlob successfully for exifArrayBuffer: ${exifArrayBuffer}`);
 
        let exifValue: Record<string, string | null> = await metadata.getProperties(camelCaseMetadataKeys);
        if (exifValue != undefined) {
          camelCaseMetadataKeys.forEach((key) => {
            console.info(`${testNum} getProperties read success for key: ${key}, exifValue: ${exifValue[key]}`);
          });
        }
        
        const imageSourceApiModify = await getImageSource(targetFileName, type);
        let metadataModify: image.Metadata;
        if (index !== undefined) {
          metadataModify = await getMetadataFromPicture(imageSourceApiModify, index);
        } else {
          metadataModify = await getMetadataFromPicture(imageSourceApiModify);
        }
        try {
          await metadataModify.setBlob(exifArrayBuffer);
          let exifValueGet: Record<string, string | null> = await metadataModify.getProperties(camelCaseMetadataKeys);
 
          camelCaseMetadataKeys.forEach((camelCaseKey) => {
            if (exifValue && exifValueGet) {
              if (!compareValues(exifValue[camelCaseKey], exifValueGet[camelCaseKey])) {
                console.info(`${testNum} Verification failed for key: ${camelCaseKey}, exifValue: ${exifValue[camelCaseKey]}, exifValueGet: ${exifValueGet[camelCaseKey]}`);
                result = false;
              }
            }
          });
        } catch (error) {
          console.error(`${testNum} Error testGetAndSetBlobArrayBuffer err: ${error}`);
          result = false;
        } finally {
          await imageSourceApiModify?.release();
        }
      } catch (err) {
        console.error(`${testNum} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      return result;
    }
 
    const getMetadataObject = (
      typeMetadata: string,
      imageMetadata: image.ImageMetadata
    ) => {
      if (typeMetadata == "exifMetadata") return imageMetadata.exifMetadata;
      if (typeMetadata == "makerNoteHuaweiMetadata") return imageMetadata.makerNoteHuaweiMetadata;
      if (typeMetadata == "heifsMetadata") return imageMetadata.heifsMetadata;
      return undefined;
    };
 
    const testExifMetadataGetAndSetBlob = async (
      testNum: string,
      sourceFileName: string,
      targetFileName: string,
      type: string,
      typeMetadata: string,
      camelCaseMetadataKeys: Array<string>
    ): Promise<boolean> => {
      let result = true;
      const imageSourceApi = await getImageSource(sourceFileName, type);
      try {
        const exifValue = await imageSourceApi.readImageMetadata(camelCaseMetadataKeys, 0);
        const sourceMetadata = getMetadataObject(typeMetadata, exifValue);
        const sourceMetadataKeys = await sourceMetadata?.getProperties(camelCaseMetadataKeys);
        console.info(`${testNum} getMetadataObject successfully for sourceMetadata : ${JSON.stringify(sourceMetadataKeys)}` );
 
        if (!sourceMetadata) {
          console.info(`${testNum} Source metadata not found.`);
          return false;
        }
        const actualBlob: ArrayBuffer = await sourceMetadata.getBlob();
        console.info(`${testNum} getBlob successfully for exifArrayBuffer: ${actualBlob != undefined}`);
 
        const imageSourceApiModify = await getImageSource(targetFileName, type);
        try {
          
          const exifValueGet = await imageSourceApiModify.readImageMetadata(camelCaseMetadataKeys, 0);
          let targetMetadata = getMetadataObject(typeMetadata, exifValueGet);
          if (!targetMetadata) {
            console.info(`${testNum} Target metadata not found.`);
            return false;
          }
          await targetMetadata.setBlob(actualBlob);
 
          let getMetadata = await targetMetadata?.getProperties(camelCaseMetadataKeys);
          camelCaseMetadataKeys.forEach((key) => {
            const actualValue: string | number | object | number[] | undefined | null | ArrayBuffer = sourceMetadataKeys![key];
            const verifyValue: string | number | object | number[] | undefined | null | ArrayBuffer = getMetadata![key];
            if (!compareValues(actualValue, verifyValue)) {
              console.info(`${testNum} Verification failed for key: ${key}, verifyValue: ${JSON.stringify(verifyValue)}, actualValue: ${JSON.stringify(actualValue)}`);
              result = false;
            }
          });
        } catch (error) {
          console.error(`${testNum} Error setBlob: ${error}`);
          result = false;
        } finally {
          await imageSourceApiModify?.release();
        }
      } catch (err) {
        console.error(`${testNum} Error processing: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      return result;
    }
 
    let sleep = async (delay: number): Promise<void> => {
      return new Promise((resolve, _) => {
        setTimeout(async () => {
          resolve();
        }, delay);
      });
    };
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100
     * @tc.desc        Verify transfer EXIF metadata between JPEG images using getBlob and setBlob
     *                 1.Read EXIF metadata from source JPEG as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target JPEG using setBlob
     *                 3.Read properties from target using getProperties
     *                 4.Verify transferred properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make", "ExifVersion"];
      let result = await testGetAndSetBlobArrayBuffer(testTag, "food.jpg", "test_exif_v2.jpg", "fd", camelCaseMetadataKeys);
      console.info(`${testTag} testGetAndSetBlobArrayBuffer result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200
     * @tc.desc        Verify transfer EXIF metadata between JPEG and HEIC images using getBlob and setBlob
     *                 1.Read EXIF metadata from source JPEG as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Read properties from target using getProperties
     *                 4.Verify transferred properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200";
      let fileName = "test_exif_v2.heic";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make", "ExifVersion"];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        let result = await testGetAndSetBlobArrayBuffer(testTag, "food.jpg", fileName, "fd", camelCaseMetadataKeys);
        console.info(`${testTag} testGetAndSetBlobArrayBuffer result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300
     * @tc.desc        Verify transfer EXIF metadata between JPEG and HEIC images using getBlob and setBlob
     *                 1.Read EXIF metadata from source JPEG as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Read properties from target using getProperties
     *                 4.Verify transferred properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make", "ExifVersion"];
      let testNumber = 100;
      let result = true;
      for(let i = 0; i < testNumber; i++){
        let rs = await testGetAndSetBlobArrayBuffer(testTag, "food.jpg", "test_exif_v2.jpg", "fd", camelCaseMetadataKeys);
        console.info(`${testTag} testGetAndSetBlobArrayBuffer result is: ${rs}`);
        result = rs && result;
      }
      expect(result).assertTrue();
      done();
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100
     * @tc.desc        Verify setBlob error handling for empty ArrayBuffer
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture
     *                 3.Attempt to write empty ArrayBuffer using setBlob
     *                 4.Verify API throws PROPERTY_NOT_EXIST error for invalid data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100";
      const emptyArrayBuffer: ArrayBuffer = new ArrayBuffer(0);
      console.info(`${testTag} Created empty ArrayBuffer with length: ${emptyArrayBuffer.byteLength}`);
 
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "fd");
      let metadataModify = await getMetadataFromPicture(imageSourceApi);
      try {
        await metadataModify.setBlob(emptyArrayBuffer);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
 
      console.info(`${testTag} setBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0200
     * @tc.desc        Verify setBlob error handling for empty ArrayBuffer
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture
     *                 3.Attempt to write empty ArrayBuffer using setBlob
     *                 4.Verify API throws PROPERTY_NOT_EXIST error for invalid data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0200";
 
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "fd");
      let metadataModify = await getMetadataFromPicture(imageSourceApi);
      try {
        await metadataModify.setBlob(null);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
 
      console.info(`${testTag} setBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0300
     * @tc.desc        Verify setBlob error handling for empty ArrayBuffer
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture
     *                 3.Attempt to write empty ArrayBuffer using setBlob
     *                 4.Verify API throws PROPERTY_NOT_EXIST error for invalid data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0300";
 
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "fd");
      let metadataModify = await getMetadataFromPicture(imageSourceApi);
      try {
        await metadataModify.setBlob(undefined);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
 
      console.info(`${testTag} setBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
 
  });
}