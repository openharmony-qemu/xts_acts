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

import { expect, describe, it, beforeEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ContainerPickerItemHeight(){

  describe('ContainerPickerItemHeight', () => {
    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ITEMHEIGHT_0100
     * @tc.name        TestContainerPickerItemHeight001
     * @tc.desc        testing ContainerPicker ItemHeight
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerItemHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerItemHeight001()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ITEMHEIGHT_0200
     * @tc.name        TestContainerPickerItemHeight002
     * @tc.desc        testing ContainerPicker ItemHeight
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerItemHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerItemHeight002()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ITEMHEIGHT_0300
     * @tc.name        TestContainerPickerItemHeight003
     * @tc.desc        testing ContainerPicker ItemHeight
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerItemHeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerItemHeight003()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ITEMHEIGHT_0400
     * @tc.name        TestContainerPickerItemHeight004
     * @tc.desc        testing ContainerPicker ItemHeight
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('TestContainerPickerItemHeight004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerItemHeight004()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ITEMHEIGHT_0500
     * @tc.name        TestContainerPickerItemHeight005
     * @tc.desc        testing ContainerPicker ItemHeight
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('TestContainerPickerItemHeight005', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerItemHeight005()).assertEqual(0)
      done();
    });
  })
}