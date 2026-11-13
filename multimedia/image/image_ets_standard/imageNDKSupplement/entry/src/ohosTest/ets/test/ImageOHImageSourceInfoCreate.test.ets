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
import image from '@ohos.multimedia.image';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium-dynamic";
import testNapi from 'libimageEffect.so'
import fileio from '@ohos.fileio'
import { common } from "@kit.AbilityKit";
import { JSON } from '@kit.ArkTS';
import { driveFn, getPermission, sleep } from "./common";

const EFFECT_SUCCESS = 0;
const EFFECT_ERROR_PARAM_INVALID = 401;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const TAG = 'OHImageSizeSupp';

export default function ImageOHImageSourceInfoCreate() {
  describe('ImageOHImageSourceInfoCreate', () => {
    beforeAll(async () => {
      await getPermission();
      await driveFn();
    });
    beforeEach(() => {
    });
    afterEach(async () => {
      await sleep(200);
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_INFO_CREATE_SUPP_0100
     * @tc.name    SUB_IMAGE_SOURCE_INFO_CREATE_SUPP_0100
     * @tc.desc    OH_ImageSourceInfo_Create-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_INFO_CREATE_SUPP_0100', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_SOURCE_INFO_CREATE_SUPP_0100"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageSourceInfoCreateTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0100
     * @tc.name    SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0100
     * @tc.desc    OH_ImageNative_GetFormat-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0100', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0100"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageNativeGetFormatTest(CASE_INDEX_1, (receiver: image.ImageReceiver) => {
      })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0200
     * @tc.name    SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0200
     * @tc.desc    OH_ImageNative_GetFormat-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0200', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_FORMAT_SUPP_0200"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageNativeGetFormatTest(CASE_INDEX_2, (receiver: image.ImageReceiver) => {
      })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0100
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0100
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0100', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0100"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageNativeGetBufferDataTest(CASE_INDEX_1, (receiver: image.ImageReceiver) => {
      })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0200
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0200
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0200', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_SUPP_0200"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageNativeGetBufferDataTest(CASE_INDEX_2, (receiver: image.ImageReceiver) => {
      })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0100
     * @tc.name    SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0100
     * @tc.desc    OH_IMAGE_NATIVE_GET_COLOR_SPACE-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0100', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0100"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageNativeGetColorSpaceTest(CASE_INDEX_1, (receiver: image.ImageReceiver) => {
      })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0200
     * @tc.name    SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0200
     * @tc.desc    OH_IMAGE_NATIVE_GET_COLOR_SPACE-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0200', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_COLOR_SPACE_SUPP_0200"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageNativeGetColorSpaceTest(CASE_INDEX_2, (receiver: image.ImageReceiver) => {
      })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_OH_PIXELMAP_NATIVE_READ_PIXELS_SUPP_0100
     * @tc.name    SUB_OH_PIXELMAP_NATIVE_READ_PIXELS_SUPP_0100
     * @tc.desc    SUB_OH_PIXELMAP_NATIVE_READ_PIXELS-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_OH_PIXELMAP_NATIVE_READ_PIXELS_SUPP_0100', Level.LEVEL0, async () => {
      const testName = "SUB_OH_PIXELMAP_NATIVE_READ_PIXELS_SUPP_0100"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeReadPixelsTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXELMAP_NATIVE_WRITE_PIXELS_SUPP_0100
     * @tc.name    SUB_OH_PIXELMAP_NATIVE_WRITE_PIXELS_SUPP_0100
     * @tc.desc    SUB_OH_PIXELMAP_NATIVE_WRITE_PIXELS-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_OH_PIXELMAP_NATIVE_WRITE_PIXELS_SUPP_0100', Level.LEVEL0, async () => {
      const testName = "SUB_OH_PIXELMAP_NATIVE_WRITE_PIXELS_SUPP_0100"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeWritePixelsTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0100
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0100
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-EFFECT_SUCCESS
     * @tc.size    MediumTest0
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0100', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0100"
      console.info(TAG, testName, 'Start',);
      let result: number =
        testNapi.OHImageNativeGetBufferDataValueTest(CASE_INDEX_1, (receiver: image.ImageReceiver) => {
        })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0200
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0200
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-BUFFER_SIZE-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0200', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0200"
      console.info(TAG, testName, 'Start',);
      let result: number =
        testNapi.OHImageNativeGetBufferDataValueTest(CASE_INDEX_2, (receiver: image.ImageReceiver) => {
        })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0300
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0300
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-PIXEL_STRIDE-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0300', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0300"
      console.info(TAG, testName, 'Start',);
      let result: number =
        testNapi.OHImageNativeGetBufferDataValueTest(CASE_INDEX_3, (receiver: image.ImageReceiver) => {
        })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0400
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0400
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-NUM_STRIDE-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0400', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0400"
      console.info(TAG, testName, 'Start',);
      let result: number =
        testNapi.OHImageNativeGetBufferDataValueTest(CASE_INDEX_4, (receiver: image.ImageReceiver) => {
        })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0500
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0500
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-ROW_STRIDE-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0500', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0500"
      console.info(TAG, testName, 'Start',);
      let result: number =
        testNapi.OHImageNativeGetBufferDataValueTest(CASE_INDEX_5, (receiver: image.ImageReceiver) => {
        })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result === EFFECT_SUCCESS || result === EFFECT_ERROR_PARAM_INVALID).assertTrue();
    });
    /**
     * @tc.number  SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0600
     * @tc.name    SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0600
     * @tc.desc    OH_IMAGE_NATIVE_GET_BUFFER_DATA-NATIVE_BUFFER-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0600', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_NATIVE_GET_BUFFER_DATA_VALUE_SUPP_0600"
      console.info(TAG, testName, 'Start',);
      let result: number =
        testNapi.OHImageNativeGetBufferDataValueTest(CASE_INDEX_6, (receiver: image.ImageReceiver) => {
        })
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
  })
}