/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'

export default function ActsMediaLibraryTest() {
  describe('ActsMediaLibraryTest', () => {
    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100
     * @tc.desc    : test OH_MediaAssetChangeRequest_AddResourceWithUri parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestAddResourceWithUriParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200
     * @tc.desc    : test OH_MediaAssetChangeRequest_AddResourceWithBuffer parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestAddResourceWithBufferParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300
     * @tc.desc    : test OH_MediaAssetChangeRequest_GetWriteCacheHandler parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestGetWriteCacheHandlerParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400
     * @tc.desc    : test OH_MediaAssetChangeRequest_SaveCameraPhoto parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestSaveCameraPhotoParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500
     * @tc.desc    : test OH_MediaAssetChangeRequest_DiscardCameraPhoto parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestDiscardCameraPhotoParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}