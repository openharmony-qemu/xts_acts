'use static';
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { Context } from '@kit.AbilityKit';
import resourceManager from '@ohos.resourceManager';

const TAG = 'getImagePropertiesTestSupp'
let fdNumber: int;

async function getFd(fileName: string) {
  let context: Context = Hypium.get("Context") as Context;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  console.info(TAG, "image case open fd success " + fdNumber);
  return fdNumber;
}

let getCompareData = (
  orientation: string,
  imageLength: string,
  imageWidth: string
): Record<string, string | null> => {
  const value: Record<string, string | null> = {};
  value[image.PropertyKey.ORIENTATION] = orientation;
  value[image.PropertyKey.IMAGE_LENGTH] = imageLength;
  value[image.PropertyKey.IMAGE_WIDTH] = imageWidth;
  return value;
}

interface picTypeValue2 {
  name: string
  fileName: string
  value?: Record<string, string | null>
  initValue?: Record<string, string | null>
  modifyData?: string
  compareData?: string
  errorData?: string
}

async function getImageSource(path: string): Promise<image.ImageSource | undefined> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  // console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function getImagePropertiesTest() {
  describe('getImagePropertiesTest', () => {
    let filePath: string = "";

    const getBuffer = (fileName: string) => {
      let context: Context = Hypium.get("Context") as Context;
      const filePath = context.filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }
    //创建imageSource对象并返回
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //fileName: 文件名,例: test_exif_v2.jpg
    const getImageSourceWithType = async (fileName:string, type:string): Promise<image.ImageSource> => {
      let imageSourceApi:image.ImageSource | undefined;
      if(type === "buffer"){
        const buffer = getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        await getFd(fileName);
        let context: Context = Hypium.get("Context") as Context;
        const filePath = context.filesDir + '/' + fileName;
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = Context!.resourceManager;
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
        await resourceMgr.closeRawFd(fileName);
      }else if(type === "incremental") {
        const picBuffer = getBuffer(fileName)
        imageSourceApi = image.createIncrementalSource(picBuffer)
      }else{
        await getFd(fileName);
        imageSourceApi = image.createImageSource(fdNumber);
        fs.closeSync(fdNumber); // getFd open fd，创建ImageSource后，close fd。
      }
      expect(imageSourceApi != undefined).assertTrue();
      return imageSourceApi!;
    }

    //创建imageSource，批量读取exif信息，读取到的值与预期值对比,返回结果 True/false
    //testTag 用例编号
    //keys: 需要读取的字段列表，例 [image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
    //compareData: 预期读取到的值，使用JSON序列化后的结果
    //fileName: 文件名,例: test_exif_v2.jpg
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    const testGetImageProperties = async (
      testTag: string,
      keys: Array<image.PropertyKey>,
      compareData: Record<string, string | null> | undefined,
      fileName:string,
      type:string
    ): Promise<boolean> => {
      let checkResult = false
      try {
        const imageSourceApi = await getImageSourceWithType(fileName, type)
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
        } else {
          const data = await imageSourceApi.getImageProperties(keys)
          if (compareData == undefined) {
            console.info(testTag + "compareData == undefined");
          } else {
            keys.forEach((item: image.PropertyKey) => {
              console.info(testTag + "data: " + data[item]);
              console.info(testTag + "compareData: " + compareData[item]);
              checkResult = data[item] == compareData[item];
              console.info(testTag + "checkResult: " + checkResult);
            })
          }
          if(!checkResult){
            console.info(
              `testGetPromise error %{public}s  fileName: %{public}s result: %{public}s value: %{public}s`,
              testTag, fileName, `${data}`, compareData);
          }
          await imageSourceApi.release();
        }
      } catch (error) {
        console.info(testTag + "testGetImageProperties" + error);
      }
      return checkResult
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
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.desc   getImageProperties_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTIES_PROMISE_STATIC_0100';
      try {
        let valueDng: Record<string, string | null> = getCompareData("Top-left", "192", "256");
        let value: Record<string, string | null> = getCompareData("Left-bottom", "65535", "65535");
        let rawfileValue: Record<string, string | null> = getCompareData("Top-left", "0", "0");
        let rawfileValueWebp: Record<string, string | null> = getCompareData("Top-right", "4608", "3456");

        const filesList: Array<picTypeValue2> = [
          {name: "jpeg", fileName: "test_exif_v2.jpg", value: value, initValue: rawfileValue},
          {name: "png", fileName: "test_exif_v2.png", value: value, initValue: rawfileValue},
          {name: "webp", fileName: "test_exif_v2.webp", value: value, initValue: rawfileValueWebp},
          {name: "dng", fileName: "test_exif_v2.dng", value: valueDng, initValue: valueDng}]
        let result = true
        const createImageSourceTypes = ["fd", "uri", "buffer"]
        const keys = [image.PropertyKey.ORIENTATION, image.PropertyKey.IMAGE_LENGTH, image.PropertyKey.IMAGE_WIDTH]
        for(let k=0; k<createImageSourceTypes.length; k++) {
          for (let i = 0; i < filesList.length; i++) {
            const testType = createImageSourceTypes[k];
            console.info(testTag + " testGetImageProperties createImageSourceTypes: " + createImageSourceTypes[k]);
            let compareData = filesList[i].initValue;
            const fileName = filesList[i].fileName;
            console.info(testTag + " testGetImageProperties fileName: " + fileName);
            const checkResult = await testGetImageProperties(testTag, keys, compareData, fileName, testType)
            result = result && checkResult
            console.info(testTag + " testGetImageProperties result: " + result);
          }
        }
        expect(result).assertTrue();
        done()
      } catch (e) {
        console.info(`getImageProperties error ` +  JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0200
     * @tc.desc       jpeg格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0200';
      const path = 'test_exif_v2.jpg';
      try {
        const imageSourceApi = await getImageSource(path);
        console.info(`${testName} getImageSource success`);
        let value = await imageSourceApi!.getImageProperties([])
        console.info(`${testName} getImageProperties success, value is: ${JSON.stringify(value)}`);
        expect(JSON.stringify(value).toString()).assertEqual('{}');
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0400
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0400
     * @tc.desc       png格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0400';
      const path = 'test_exif_v2.png';
      try {
        const imageSourceApi = await getImageSource(path);
        console.info(`${testName} getImageSource success`);
        let value = await imageSourceApi!.getImageProperties([])
        console.info(`${testName} getImageProperties success, value is: ${JSON.stringify(value)}`);
        expect(JSON.stringify(value).toString()).assertEqual('{}');
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0600
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0600
     * @tc.desc       HEIC格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0600';
      const path = 'all_auxtype.heic';
      try {
        const imageSourceApi = await getImageSource(path);
        console.info(`${testName} getImageSource success`);
        let value = await imageSourceApi!.getImageProperties([])
        console.info(`${testName} getImageProperties success, value is: ${JSON.stringify(value)}`);
        expect(JSON.stringify(value).toString()).assertEqual('{}');
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0800
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0800
     * @tc.desc       webp格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_PROPERTIES_ABNORMAL_TEST_0800';
      const path = 'test_exif_v2.webp';
      try {
        const imageSourceApi = await getImageSource(path);
        console.info(`${testName} getImageSource success`);
        let value = await imageSourceApi!.getImageProperties([])
        console.info(`${testName} getImageProperties success, value is: ${JSON.stringify(value)}`);
        expect(JSON.stringify(value).toString()).assertEqual('{}');
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })
  })
}