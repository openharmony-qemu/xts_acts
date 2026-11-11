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

export default function RequestSetFilterOccludedTest() {

  describe('RequestSetFilterOccludedTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETFILTEROCCLUDED_0100
     * @tc.name   RequestSetFilterOccludedTest001
     * @tc.desc   Enable filter occluded nodes on visible tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RequestSetFilterOccludedTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RequestSetFilterOccludedTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETFILTEROCCLUDED_0200
     * @tc.name   RequestSetFilterOccludedTest002
     * @tc.desc   Disable filter occluded nodes on visible tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RequestSetFilterOccludedTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RequestSetFilterOccludedTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETFILTEROCCLUDED_0300
     * @tc.name   RequestSetFilterOccludedTest003
     * @tc.desc   Disable filter occluded nodes on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RequestSetFilterOccludedTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RequestSetFilterOccludedTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETFILTEROCCLUDED_0400
     * @tc.name   RequestSetFilterOccludedTest004
     * @tc.desc   Enable filter occluded nodes on full tree request, expect ATTRIBUTE_OR_EVENT_NOT_SUPPORTED
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RequestSetFilterOccludedTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RequestSetFilterOccludedTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETFILTEROCCLUDED_0500
     * @tc.name   RequestSetFilterOccludedTest005
     * @tc.desc   Set filter occluded nodes with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RequestSetFilterOccludedTest005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RequestSetFilterOccludedTest005()).assertEqual(0)
      done()
    })
  })

  describe('RequestSetOcclusionOpacityThresholdTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETOCCLUSIONOPACITYTHRESHOLD_0100
     * @tc.name   RequestSetOcclusionOpacityThresholdTest001
     * @tc.desc   Set occlusion opacity threshold 0.0 (lower boundary) on visible tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RequestSetOcclusionOpacityThresholdTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RequestSetOcclusionOpacityThresholdTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETOCCLUSIONOPACITYTHRESHOLD_0200
     * @tc.name   RequestSetOcclusionOpacityThresholdTest002
     * @tc.desc   Set occlusion opacity threshold 1.0 (upper boundary) on visible tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RequestSetOcclusionOpacityThresholdTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RequestSetOcclusionOpacityThresholdTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETOCCLUSIONOPACITYTHRESHOLD_0300
     * @tc.name   RequestSetOcclusionOpacityThresholdTest003
     * @tc.desc   Set occlusion opacity threshold with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RequestSetOcclusionOpacityThresholdTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RequestSetOcclusionOpacityThresholdTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETOCCLUSIONOPACITYTHRESHOLD_0400
     * @tc.name   RequestSetOcclusionOpacityThresholdTest004
     * @tc.desc   Set occlusion opacity threshold 1.5 (out of range) on visible tree request, expect PARAM_OUT_OF_RANGE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RequestSetOcclusionOpacityThresholdTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RequestSetOcclusionOpacityThresholdTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETOCCLUSIONOPACITYTHRESHOLD_0500
     * @tc.name   RequestSetOcclusionOpacityThresholdTest005
     * @tc.desc   Set occlusion opacity threshold on full tree request, expect ATTRIBUTE_OR_EVENT_NOT_SUPPORTED
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RequestSetOcclusionOpacityThresholdTest005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RequestSetOcclusionOpacityThresholdTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_REQUESTSETOCCLUSIONOPACITYTHRESHOLD_0600
     * @tc.name   RequestSetOcclusionOpacityThresholdTest006
     * @tc.desc   Set occlusion opacity threshold -1 (out of range) on visible tree request, expect PARAM_OUT_OF_RANGE
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RequestSetOcclusionOpacityThresholdTest006', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.RequestSetOcclusionOpacityThresholdTest006()).assertEqual(0)
      done()
    })
  })
}
