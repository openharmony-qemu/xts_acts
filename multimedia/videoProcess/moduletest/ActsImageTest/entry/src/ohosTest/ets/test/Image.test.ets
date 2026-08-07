/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libImageTest from 'libimagetest.so';

export default function ImageTest() {
  describe('ImageTest', () => {
    beforeAll(() => {
      libImageTest.initTests();
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00100
     * @tc.number SUB_VPE_IMAGE_API_TEST_00100
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00100', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00200
     * @tc.number SUB_VPE_IMAGE_API_TEST_00200
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00200', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00300
     * @tc.number SUB_VPE_IMAGE_API_TEST_00300
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00300', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00400
     * @tc.number SUB_VPE_IMAGE_API_TEST_00400
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00400', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00500
     * @tc.number SUB_VPE_IMAGE_API_TEST_00500
     * @tc.desc   OH_ImageProcessing_DeinitializeEnvironment IMAGE_PROCESSING_ERROR_OPERATION_NOT_PERMITTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00500', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00600
     * @tc.number SUB_VPE_IMAGE_API_TEST_00600
     * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00600', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00700
     * @tc.number SUB_VPE_IMAGE_API_TEST_00700
     * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00700', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00800
     * @tc.number SUB_VPE_IMAGE_API_TEST_00800
     * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00800', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_00900
     * @tc.number SUB_VPE_IMAGE_API_TEST_00900
     * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_00900', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest00900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_01000
     * @tc.number SUB_VPE_IMAGE_API_TEST_01000
     * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_01000', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest01000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_01100
     * @tc.number SUB_VPE_IMAGE_API_TEST_01100
     * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_01100', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest01100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_01200
     * @tc.number SUB_VPE_IMAGE_API_TEST_01200
     * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_01200', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest01200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_01300
     * @tc.number SUB_VPE_IMAGE_API_TEST_01300
     * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_01300', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest01300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_IMAGE_API_TEST_01400
     * @tc.number SUB_VPE_IMAGE_API_TEST_01400
     * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_IMAGE_API_TEST_01400', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.VpeImageApiTest01400();
      expect(result).assertEqual(0);
      done();
    })
  })
}
