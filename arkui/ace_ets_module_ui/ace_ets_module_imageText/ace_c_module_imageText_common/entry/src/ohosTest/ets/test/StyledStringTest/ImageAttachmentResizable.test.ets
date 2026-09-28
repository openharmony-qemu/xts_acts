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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function ImageAttachmentResizableTest() {
  describe('ImageAttachmentResizableTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageAttachmentResizableTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableSlice_0100
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableSlice_0100
     * @tc.desc   Test SetResizableSlice normal values return NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableSlice_0100', Level.LEVEL1, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_001()).assertEqual(0)
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0200
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0200
     * @tc.desc   Test GetResizableSlice after SetResizableSlice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0200', Level.LEVEL1, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_002()).assertEqual(0)
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableSlice_0300
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableSlice_0300
     * @tc.desc   Test SetResizableSlice nullptr attachment returns PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableSlice_0300', Level.LEVEL2, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_003()).assertEqual(0)
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0400
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0400
     * @tc.desc   Test GetResizableSlice nullptr attachment returns PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0400', Level.LEVEL2, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_004()).assertEqual(0)
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0500
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0500
     * @tc.desc   Test GetResizableSlice nullptr out params returns PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_GetResizableSlice_0500', Level.LEVEL2, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_005()).assertEqual(0)
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0600
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0600
     * @tc.desc   Test SetResizableLattice with valid lattice returns NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0600', Level.LEVEL1, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_006()).assertEqual(0)
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0800
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0800
     * @tc.desc   Test SetResizableLattice nullptr attachment returns PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0800', Level.LEVEL2, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_008()).assertEqual(0)
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0900
     * @tc.number SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0900
     * @tc.desc   Test SetResizableLattice nullptr lattice returns PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_OH_ArkUI_ImageAttachment_SetResizableLattice_0900', Level.LEVEL2, async () => {
      expect(nativeFunc.ImageAttachmentResizableTest_009()).assertEqual(0)
    });
  });
}
