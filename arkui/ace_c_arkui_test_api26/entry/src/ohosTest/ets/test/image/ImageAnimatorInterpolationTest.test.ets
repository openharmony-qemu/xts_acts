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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ImageAnimatorInterpolationTest() {

  describe('ImageAnimatorInterpolationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageAnimatorInterpolation001
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0100
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION with ARKUI_IMAGE_INTERPOLATION_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorInterpolation001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageAnimatorInterpolation002
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0200
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION with ARKUI_IMAGE_INTERPOLATION_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorInterpolation002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageAnimatorInterpolation003
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0300
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION with ARKUI_IMAGE_INTERPOLATION_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorInterpolation003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageAnimatorInterpolation004
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0400
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION with ARKUI_IMAGE_INTERPOLATION_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorInterpolation004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageAnimatorInterpolation005
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0500
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION default value is ARKUI_IMAGE_INTERPOLATION_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorInterpolation005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageAnimatorInterpolation006
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0600
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION reset returns default value ARKUI_IMAGE_INTERPOLATION_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAnimatorInterpolation006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageAnimatorInterpolation007
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0700
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION set then reset returns default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageAnimatorInterpolation007', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageAnimatorInterpolation008
     * @tc.number SUB_ARKUI_IMAGEANIMATORINTERPOLATION_TEST_0800
     * @tc.desc   Test NODE_IMAGE_ANIMATOR_INTERPOLATION set multiple values sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageAnimatorInterpolation008', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorInterpolation008()).assertEqual(0)
      done()
    })
  })
}
