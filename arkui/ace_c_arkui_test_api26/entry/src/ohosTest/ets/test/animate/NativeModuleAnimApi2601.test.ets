/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import nativeAnim from 'libnativeanim.so';

export default function nativeModuleAnimApi2601Test() {
  describe('nativeModuleAnimApi2601Test', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0001
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0001
     * @tc.desc   ARKUI_ERROR_CODE_TARGET_NODE_NOT_IN_SAME_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0001', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601ErrSameCtx001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0002
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0002
     * @tc.desc   NODE_TRANSFORM_3D set/get and invalid size/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0002', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601Transform3D002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0003
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0003
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION_X create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0003', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601TransX003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0004
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0004
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION_Y create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0004', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601TransY004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0005
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0005
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_TRANSLATION_Z create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0005', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601TransZ005()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0006
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0006
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_SCALE create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0006', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601Scale006()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0007
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0007
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_SCALE_X create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0007', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601ScaleX007()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0008
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0008
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_SCALE_Y create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0008', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601ScaleY008()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0009
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0009
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_ROTATION create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0009', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601Rot009()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0010
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0010
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_ROTATION_X create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0010', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601RotX010()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0011
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0011
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_ROTATION_Y create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0011', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601RotY011()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0012
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0012
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_ROTATION_Z create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0012', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601RotZ012()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0013
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0013
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_BOUNDS create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0013', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601Bounds013()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0014
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0014
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_X create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0014', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601BoundsX014()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0015
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0015
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_Y create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0015', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601BoundsY015()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0016
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0016
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_WIDTH create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0016', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601BoundsW016()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0017
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0017
     * @tc.desc   OH_ARKUI_ANIMATION_PROPERTY_BOUNDS_HEIGHT create/set + null abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_API2601_0017', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimApi2601BoundsH017()).assertEqual(0);
      done();
    });
  })
}
