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
 
let cacheDir: string | undefined;
let isSupportHEIFDecode: boolean;
let isSupportHdr: Boolean;
let isSupportedTiff: boolean = true;
type MetadataScalar = string | number | number[] | object | undefined | null | boolean;
 
export default function MakerNoteGetBlobTest() {
  describe("MakerNoteGetBlobTest", () => {
 
    beforeAll(async () => {
      cacheDir = AppStorage.get('cacheDir')
      let filePath = AppStorage.get('pathDir') + '/' + "test.jpg";
      let imageSource: image.ImageSource = image.createImageSource(filePath);
      console.info('imageSource is ' + imageSource);
      isSupportHEIFDecode = imageSource.supportedFormats.includes('image/heic');
      console.info('isSupportHEIFDecode is ' + isSupportHEIFDecode);
      isSupportHdr =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
      let formats = await image.getImageSourceSupportedFormats();
      isSupportedTiff = formats.includes('image/tiff');
      console.info('isSupportedTiff is ' + isSupportedTiff);
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
 
    let sleep = async (delay: number): Promise<void> => {
      return new Promise((resolve, _) => {
        setTimeout(async () => {
          resolve();
        }, delay);
      });
    };
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100"
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "fd");
      try {
        const imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        let makerNoteArrayBuffer: ArrayBuffer = await imageMetadata.makerNoteHuaweiMetadata!.getBlob();
        console.info(`${testTag} readImageMetadata successfully for makerNoteArrayBuffer: ${makerNoteArrayBuffer}`);
        result = (makerNoteArrayBuffer != undefined && makerNoteArrayBuffer!.byteLength > 0);
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata getBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200"
      let result = false;
      let fileName = "test_exif_v2.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource(fileName, "fd");
        try {
          const imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        let makerNoteArrayBuffer: ArrayBuffer = await imageMetadata.makerNoteHuaweiMetadata!.getBlob();
          console.info(`${testTag} readImageMetadata successfully for makerNoteArrayBuffer: ${makerNoteArrayBuffer}`);
          result = (makerNoteArrayBuffer != undefined && makerNoteArrayBuffer!.byteLength > 0);
        } catch (err) {
          console.error(`${testTag} Error processing err: ${err}`);
          result = false;
        }
        console.info(`${testTag} getBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300"
      let result = true;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "fd");
      try {
        const imageMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        const makerNoteHuaweiMetadata = imageMetadata.makerNoteHuaweiMetadata;
        let testNumber = 100;
        let makerNoteArrayBuffer: ArrayBuffer;
        for(let i = 0; i < testNumber; i++){
            makerNoteArrayBuffer = await makerNoteHuaweiMetadata!.getBlob();
            console.info(`${testTag} readImageMetadata successfully for makerNoteArrayBuffer: ${makerNoteArrayBuffer}`);
            result = (makerNoteArrayBuffer != undefined && makerNoteArrayBuffer!.byteLength > 0) && result; 
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata getBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
  });
}