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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium-dynamic";
import testNapi from 'libimageEffect.so'
import { common } from "@kit.AbilityKit";
import fileio from '@ohos.fileio'
import image from "@ohos.multimedia.image";

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const TAG = 'ImageNdk.ImageReceiverNativeTest'
let fdNumber: number;
let isSupportAVIF: Boolean;

async function getFd(path: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + path;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}
export default function ImageReceiverNativeTest() {
  describe('ImageReceiverNativeTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      isSupportAVIF = image.getImageSourceSupportedFormats().includes("image/avif");
      console.info(TAG, ' isSupportAVIF is ' + isSupportAVIF);
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
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0100
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0100
     * @tc.desc      OH_Image_Receiver_InitImageReceiverNative-nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0100", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.InitImageReceiverNativeTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0200
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0200
     * @tc.desc      OH_Image_Receiver_InitImageReceiverNative-nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0200", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.InitImageReceiverNativeTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0300
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0300
     * @tc.desc      OH_Image_ClipRect-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0300", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHImageClipRectTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0400
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0400
     * @tc.desc      OH_Image_ClipRect-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0400", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHImageClipRectTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0500
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0500
     * @tc.desc      OH_ImageReceiverNative_ReadLatestImage-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0500", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeReadLatestImageTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0600
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0600
     * @tc.desc      OH_ImageReceiverNative_ReadLatestImage-IMAGE_UNKNOWN_ERROR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0600", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeReadLatestImageTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7600901);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0700
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0700
     * @tc.desc      OH_ImageReceiverNative_ReadLatestImage-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0700", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeReadLatestImageTest(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0800
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0800
     * @tc.desc      OH_ImageSourceNative_CreatePixelmapUsingAllocator-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0800", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.CreatePixelmapUsingAllocatorTest(CASE_INDEX_1,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_0900
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_0900
     * @tc.desc      OH_ImageSourceNative_CreatePixelmapUsingAllocator-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_0900", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.CreatePixelmapUsingAllocatorTest(CASE_INDEX_2,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1000
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1000
     * @tc.desc      OH_PixelmapNative_SetMemoryName-IMAGE_BAD_SOURCE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1000", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.CreatePixelmapUsingAllocatorTest(CASE_INDEX_3,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1100
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1100
     * @tc.desc      OH_PixelmapNative_SetMemoryName-IMAGE_DECODE_FAILED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1100", Level.LEVEL0, async () => {
      if (!isSupportAVIF) {
        console.info("device does not support avif");
        return;
      }
      console.info(TAG, 'Start');
      await getFd('4K-2160x3840.avif');
      let result: number = testNapi.CreatePixelmapUsingAllocatorTest(CASE_INDEX_4,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1200
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1200
     * @tc.desc      OH_ImageSourceNative_CreatePicture-IMAGE_DECODE_FAILED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1200", Level.LEVEL0, async () => {
      if (!isSupportAVIF) {
        console.info("device does not support avif");
        return;
      }
      console.info(TAG, 'Start');
      await getFd('4K-2160x3840.avif');
      let result: number = testNapi.ImageSourceNativeCreatePictureTest(CASE_INDEX_1,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1300
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1300
     * @tc.desc      OH_ImageSourceNative_CreatePictureAtIndex-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1300", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('4K-2160x3840.avif');
      let result: number = testNapi.ImageSourceNativeCreatePictureAtIndexTest(CASE_INDEX_1,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7700102);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1400
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1400
     * @tc.desc      OH_PixelmapNative_SetMemoryName-IMAGE_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1400", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.PixelmapNativeSetMemoryNameTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1500
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1500
     * @tc.desc      OH_DecodingOptions_GetDesiredColorSpace-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1500", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.DecodingOptionsGetDesiredColorSpaceTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7700204);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1600
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1600
     * @tc.desc      OH_ImageReceiverNative_SetMemoryName-receiver为nullptr时返回IMAGE_RECEIVER_INVALID_PARAMETER(7900201)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1600", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeSetMemoryNameTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7900201);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1700
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1700
     * @tc.desc      OH_ImageReceiverNative_SetMemoryName-name为nullptr时返回IMAGE_RECEIVER_INVALID_PARAMETER(7900201)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1700", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeSetMemoryNameTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7900201);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1800
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1800
     * @tc.desc      OH_ImageReceiverNative_SetMemoryName-size为0时返回IMAGE_RECEIVER_INVALID_PARAMETER(7900201)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1800", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeSetMemoryNameTest(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7900201);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_1900
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_1900
     * @tc.desc      OH_ImageReceiverNative_SetMemoryName-name过滤后无可视字符时返回IMAGE_RECEIVER_INVALID_PARAMETER(7900201)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_1900", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeSetMemoryNameTest(CASE_INDEX_4);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7900201);
    })
    /**
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_TEST_2000
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_TEST_2000
     * @tc.desc      OH_ImageReceiverNative_SetMemoryName-name过滤后长度超过256字节时返回IMAGE_RECEIVER_INVALID_PARAMETER(7900201)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_TEST_2000", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImageReceiverNativeSetMemoryNameTest(CASE_INDEX_5);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7900201);
    })
  })
}