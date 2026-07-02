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

export default function ContainerPickerDisplayedItemCount(){

  describe('ContainerPickerDisplayedItemCount', () => {
    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_DISPLAYEDITEMCOUNT_0100
     * @tc.name        TestContainerPickerDisplayedItemCount001
     * @tc.desc        testing ContainerPicker DisplayedItemCount
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerDisplayedItemCount001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerDisplayedItemCount001()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_DISPLAYEDITEMCOUNT_0200
     * @tc.name        TestContainerPickerDisplayedItemCount002
     * @tc.desc        testing ContainerPicker DisplayedItemCount
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerDisplayedItemCount002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerDisplayedItemCount002()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_DISPLAYEDITEMCOUNT_0300
     * @tc.name        TestContainerPickerDisplayedItemCount003
     * @tc.desc        testing ContainerPicker DisplayedItemCount
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerDisplayedItemCount003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerDisplayedItemCount003()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_DISPLAYEDITEMCOUNT_0400
     * @tc.name        TestContainerPickerDisplayedItemCount004
     * @tc.desc        testing ContainerPicker DisplayedItemCount
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('TestContainerPickerDisplayedItemCount004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerDisplayedItemCount004()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_DISPLAYEDITEMCOUNT_0500
     * @tc.name        TestContainerPickerDisplayedItemCount005
     * @tc.desc        testing ContainerPicker DisplayedItemCount
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('TestContainerPickerDisplayedItemCount005', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerDisplayedItemCount005()).assertEqual(0)
      done();
    });
  })
}