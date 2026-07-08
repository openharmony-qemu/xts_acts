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

import { AppStorage } from '@kit.ArkUI';
import { $r, Context, Resource } from "@kit.ArkUI";
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium} from '@ohos/hypium-binary/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';

const TAG = 'Image.EnumSupp'

let fdNumber: int;

async function getFd(fileName: string): Promise<void> {
  let context: Context = Hypium.get("Context") as Context;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG,'image case filePath is ' + filePath);
  try {
    const file = await fs.open(filePath, fs.OpenMode.READ_ONLY);
    fdNumber = file.fd;
    console.info(TAG,"image case open fd success " + fdNumber);
  } catch (err) {
    console.info(TAG,"image case open fd err " + (err as BusinessError).message);
  }
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi!.getImageInfoSync()));
  return imageSourceApi!;
}

async function imagePropertyTest(done: Function, testName: string, path: string, propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
  console.info(TAG, testName + '- start');
  try {
    const imageSourceApi = await getImageSource(path);
    console.info(TAG, testName, 'getImageSource: ',imageSourceApi);
    imageSourceApi.getImageProperty(propertyKey)
      .then((data: string) => {
        console.info(TAG, testName, "get key : ", propertyKey, 'value: ', data);
        callback(data,undefined);
      })
      .catch((error: Error) => {
        console.info(TAG, testName,'getImageProperty error' , (error as BusinessError).message, (error as BusinessError).code);
        callback(undefined,error as BusinessError);
      })
      .finally(() => {
        console.info(TAG, testName + '- end');
        imageSourceApi.release();
        done.unsafeCall();
      })
  } catch (err) {
    expect().assertFail();
    console.error(TAG, testName, (err as BusinessError).message, (err as BusinessError).code);
    done.unsafeCall();
  }
}
export default function ImageEnumSupp(): void {
  describe('ImageEnumSupp', ()=>{
    beforeAll(async ()=>{
      console.info('beforeAll case');
    });
    beforeEach(async ()=>{
      console.info('beforeEach case');
    });
    afterEach(async ()=>{
      console.info('afterEach case');
    });
    afterAll(()=>{
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0100
     * @tc.desc   ImageFormat Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0100', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0100---------')
      expect(image.ImageFormat.YCBCR_422_SP == 1000).assertTrue();
      expect(image.ImageFormat.JPEG == 2000).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0100,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0200
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0200
     * @tc.desc   AlphaType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0200', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0200---------')
      expect(image.AlphaType.UNKNOWN == 0).assertTrue();
      expect(image.AlphaType.OPAQUE == 1).assertTrue();
      expect(image.AlphaType.PREMUL == 2).assertTrue();
      expect(image.AlphaType.UNPREMUL == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0200,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0300
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0300
     * @tc.desc   DecodingDynamicRange Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0300', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0300---------')
      expect(image.DecodingDynamicRange.AUTO == 0).assertTrue();
      expect(image.DecodingDynamicRange.HDR == 2).assertTrue();
      expect(image.DecodingDynamicRange.SDR == 1).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0300,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0400
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0400
     * @tc.desc   PackingDynamicRange Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0400', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0400---------')
      expect(image.PackingDynamicRange.AUTO == 0).assertTrue();
      expect(image.PackingDynamicRange.SDR == 1).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0400,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0500
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0500
     * @tc.desc   AntiAliasingLevel Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0500', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0500---------')
      expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
      expect(image.AntiAliasingLevel.LOW == 1).assertTrue();
      expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
      expect(image.AntiAliasingLevel.HIGH == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0500,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0600
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0600
     * @tc.desc   ComponentType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0600', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0600---------')
      expect(image.ComponentType.YUV_Y == 1).assertTrue();
      expect(image.ComponentType.YUV_U == 2).assertTrue();
      expect(image.ComponentType.YUV_V == 3).assertTrue();
      expect(image.ComponentType.JPEG == 4).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0600,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0700
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0700
     * @tc.desc   ScaleMode Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0700', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0700---------')
      expect(image.ScaleMode.CENTER_CROP == 1).assertTrue();
      expect(image.ScaleMode.FIT_TARGET_SIZE == 0).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0700,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0800
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0800
     * @tc.desc   HdrMetadataKey Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0800', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0800---------')
      expect(image.HdrMetadataKey.HDR_METADATA_TYPE == 0).assertTrue();
      expect(image.HdrMetadataKey.HDR_STATIC_METADATA == 1).assertTrue();
      expect(image.HdrMetadataKey.HDR_DYNAMIC_METADATA == 2).assertTrue();
      expect(image.HdrMetadataKey.HDR_GAINMAP_METADATA == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0800,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_0900
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_0900
     * @tc.desc   HdrMetadataType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_0900', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0900---------')
      expect(image.HdrMetadataType.NONE== 0).assertTrue();
      expect(image.HdrMetadataType.BASE == 1).assertTrue();
      expect(image.HdrMetadataType.GAINMAP == 2).assertTrue();
      expect(image.HdrMetadataType.ALTERNATE == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_0900,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_1000
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_1000
     * @tc.desc   HdrMetadataType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_1000', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_1000---------')
      expect(image.AllocatorType.AUTO== 0).assertTrue();
      expect(image.AllocatorType.DMA == 1).assertTrue();
      expect(image.AllocatorType.SHARE_MEMORY == 2).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_1000,end here---------')
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_static_1100
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_static_1100
     * @tc.desc   HdrMetadataType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_static_1100', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_1100---------')
      expect(image.CropAndScaleStrategy.SCALE_FIRST== 1).assertTrue();
      expect(image.CropAndScaleStrategy.CROP_FIRST == 2).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_static_1100,end here---------')
      done.unsafeCall();
    })
  })
}
