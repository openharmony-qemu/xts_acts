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
type MetadataScalar = string | number | number[] | object | undefined | null | boolean;
 
export default function GetBlobTest() {
  describe("GetBlobTest", () => {
 
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
 
    const getMetadataFromPicture = async (imageSourceApi: image.ImageSource, index?: number | undefined): Promise<image.Metadata> => {
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
 
    let sleep = async (delay: number): Promise<void> => {
      return new Promise((resolve, _) => {
        setTimeout(async () => {
          resolve();
        }, delay);
      });
    };
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0100
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0100"
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "fd");
      let metadata = await getMetadataFromPicture(imageSourceApi);
      try {
        let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
        console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
        result = (exifArrayBuffer != undefined && exifArrayBuffer.byteLength > 0);
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} getImagePropertyArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0200
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0200"
      let result = false;
      let fileName = "test_exif_v2.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource(fileName, "fd");
        let metadata = await getMetadataFromPicture(imageSourceApi);
        try {
          let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
          console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
          result = (exifArrayBuffer != undefined && exifArrayBuffer.byteLength > 0);
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
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0300
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0300"
      let result = true;
      let fileName = "heif.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource(fileName, "fd");
        let frameCount: number = await imageSourceApi.getFrameCount();
        console.info(`${testTag} get frameCount num is: ${frameCount}`);
        try {
          for (let index = 0; index < frameCount; index++) {
            let metadata = await getMetadataFromPicture(imageSourceApi, index);
            let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
            console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
            result = result && exifArrayBuffer != undefined;
          }
        } catch (err) {
          console.error(`${testTag} Error processing err: ${err}`);
          result = false;
        } finally {
          await imageSourceApi?.release();
        }
        console.info(`${testTag} getBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });
 
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0400
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOB_PROMISE_0400"
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "fd");
      let metadata = await getMetadataFromPicture(imageSourceApi);
      let testNumber = 100;
      try {
        for(let i = 0; i< testNumber; i++){
            let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
            console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
            result = (exifArrayBuffer != undefined && exifArrayBuffer.byteLength > 0);
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} getImagePropertyArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
 
  });
}