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

export default function GetImagesByNodeIdAsyncTest() {

  describe('GetImagesByNodeIdAsyncTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0100
     * @tc.name   GetImagesByNodeIdAsyncTest001
     * @tc.desc   Get images with null callback, expect CALLBACK_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('GetImagesByNodeIdAsyncTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0200
     * @tc.name   GetImagesByNodeIdAsyncTest002
     * @tc.desc   Get images with null context, expect UI_CONTEXT_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('GetImagesByNodeIdAsyncTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0300
     * @tc.name   GetImagesByNodeIdAsyncTest003
     * @tc.desc   Get images with count 21, expect PARAM_OUT_OF_RANGE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('GetImagesByNodeIdAsyncTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0400
     * @tc.name   GetImagesByNodeIdAsyncTest004
     * @tc.desc   Get images with count 20 and null nodeIds, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('GetImagesByNodeIdAsyncTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0500
     * @tc.name   GetImagesByNodeIdAsyncTest005
     * @tc.desc   Get images with count 0, expect PARAM_OUT_OF_RANGE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('GetImagesByNodeIdAsyncTest005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0600
     * @tc.name   GetImagesByNodeIdAsyncTest006
     * @tc.desc   Get images with count -1, expect PARAM_OUT_OF_RANGE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('GetImagesByNodeIdAsyncTest006', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0700
     * @tc.name   GetImagesByNodeIdAsyncTest007
     * @tc.desc   Get images with null userData, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('GetImagesByNodeIdAsyncTest007', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest007()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_GETIMAGESBYNODEIDASYNC_0800
     * @tc.name   GetImagesByNodeIdAsyncTest008
     * @tc.desc   Take item by node id with null collection, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('GetImagesByNodeIdAsyncTest008', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.GetImagesByNodeIdAsyncTest008()).assertEqual(0)
      done()
    })
  })
}
