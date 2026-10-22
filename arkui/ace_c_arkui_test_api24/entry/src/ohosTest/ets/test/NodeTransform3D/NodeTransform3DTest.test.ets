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

import { describe, expect, it, Level } from '@ohos/hypium';
import nativerender from 'libnativerender.so';

export default function nodeTransform3DTest() {
  describe('nodeTransform3DTest', () => {

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0001
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0001
     * @tc.desc   NODE_TRANSFORM_3D set/get with translation matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0001', Level.LEVEL0, () => {
      expect(nativerender.NodeTransform3D_SetGet001()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0002
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0002
     * @tc.desc   NODE_TRANSFORM_3D reset to identity matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0002', Level.LEVEL0, () => {
      expect(nativerender.NodeTransform3D_Reset002()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0003
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0003
     * @tc.desc   NODE_TRANSFORM_3D invalid array size (1, 15, 17 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0003', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_InvalidSize003()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0004
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0004
     * @tc.desc   NODE_TRANSFORM_3D null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0004', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_NullParam004()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0005
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0005
     * @tc.desc   NODE_TRANSFORM_3D identity matrix set/get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0005', Level.LEVEL0, () => {
      expect(nativerender.NodeTransform3D_IdentityMatrix005()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0006
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0006
     * @tc.desc   NODE_TRANSFORM_3D rotation matrix (45 degree Z-axis rotation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0006', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_RotationMatrix006()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0007
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0007
     * @tc.desc   NODE_TRANSFORM_3D scale matrix (2x, 3x, 4x)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0007', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_ScaleMatrix007()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0008
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0008
     * @tc.desc   NODE_TRANSFORM_3D translation matrix (100, 200, 50)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0008', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_TranslationMatrix008()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0009
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0009
     * @tc.desc   NODE_TRANSFORM_3D get default value (identity matrix before set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0009', Level.LEVEL0, () => {
      expect(nativerender.NodeTransform3D_GetDefault009()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0010
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0010
     * @tc.desc   NODE_TRANSFORM_3D update matrix from one value to another
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0010', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_UpdateMatrix010()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0011
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0011
     * @tc.desc   NODE_TRANSFORM_3D all-zero matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0011', Level.LEVEL2, () => {
      expect(nativerender.NodeTransform3D_ZeroMatrix011()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0012
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0012
     * @tc.desc   NODE_TRANSFORM_3D negative values in matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0012', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_NegativeValues012()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0013
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0013
     * @tc.desc   NODE_TRANSFORM_3D perspective matrix with small z coefficient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0013', Level.LEVEL2, () => {
      expect(nativerender.NodeTransform3D_PerpectiveMatrix013()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0014
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0014
     * @tc.desc   NODE_TRANSFORM_3D applied to different node types (column and stack)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0014', Level.LEVEL1, () => {
      expect(nativerender.NodeTransform3D_DifferentNodeTypes014()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0015
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0015
     * @tc.desc   NODE_TRANSFORM_3D large values (10000, 99999)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0015', Level.LEVEL2, () => {
      expect(nativerender.NodeTransform3D_LargeValues015()).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0016
     * @tc.number SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0016
     * @tc.desc   NODE_TRANSFORM_3D all 16 elements verified individually
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CAPI_NATIVE_NODE_TRANSFORM_3D_0016', Level.LEVEL0, () => {
      expect(nativerender.NodeTransform3D_AllElementsVerify016()).assertEqual(0);
    });

  })
}
