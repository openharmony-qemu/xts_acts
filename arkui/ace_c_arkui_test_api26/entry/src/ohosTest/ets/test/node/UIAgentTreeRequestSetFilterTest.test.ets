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

export default function UIAgentTreeRequestSetFilterTest() {

  describe('UIAgentTreeRequestSetFilterTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETFILTER_0100
     * @tc.name   UIAgentTreeRequestSetFilterTest001
     * @tc.desc   Enable filter pure layout nodes on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetFilterTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetFilterTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETFILTER_0200
     * @tc.name   UIAgentTreeRequestSetFilterTest002
     * @tc.desc   Disable filter pure layout nodes on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetFilterTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetFilterTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETFILTER_0300
     * @tc.name   UIAgentTreeRequestSetFilterTest003
     * @tc.desc   Set filter with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentTreeRequestSetFilterTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetFilterTest003()).assertEqual(0)
      done()
    })
  })

  describe('UIAgentTreeRequestSetInteractionInfoTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETINTERACTIONINFO_0100
     * @tc.name   UIAgentTreeRequestSetInteractionInfoTest001
     * @tc.desc   Enable interaction info collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetInteractionInfoTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetInteractionInfoTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETINTERACTIONINFO_0200
     * @tc.name   UIAgentTreeRequestSetInteractionInfoTest002
     * @tc.desc   Disable interaction info collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetInteractionInfoTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetInteractionInfoTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETINTERACTIONINFO_0300
     * @tc.name   UIAgentTreeRequestSetInteractionInfoTest003
     * @tc.desc   Set interaction info with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentTreeRequestSetInteractionInfoTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetInteractionInfoTest003()).assertEqual(0)
      done()
    })
  })

  describe('UIAgentTreeRequestSetAccessibilityInfoTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETACCESSIBILITYINFO_0100
     * @tc.name   UIAgentTreeRequestSetAccessibilityInfoTest001
     * @tc.desc   Enable accessibility info collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetAccessibilityInfoTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetAccessibilityInfoTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETACCESSIBILITYINFO_0200
     * @tc.name   UIAgentTreeRequestSetAccessibilityInfoTest002
     * @tc.desc   Disable accessibility info collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetAccessibilityInfoTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetAccessibilityInfoTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETACCESSIBILITYINFO_0300
     * @tc.name   UIAgentTreeRequestSetAccessibilityInfoTest003
     * @tc.desc   Set accessibility info with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentTreeRequestSetAccessibilityInfoTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetAccessibilityInfoTest003()).assertEqual(0)
      done()
    })
  })

  describe('UIAgentTreeRequestSetCollectVisualPropertiesTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETCOLLECTVISUALPROPERTIES_0100
     * @tc.name   UIAgentTreeRequestSetCollectVisualPropertiesTest001
     * @tc.desc   Enable visual properties collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetCollectVisualPropertiesTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetCollectVisualPropertiesTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETCOLLECTVISUALPROPERTIES_0200
     * @tc.name   UIAgentTreeRequestSetCollectVisualPropertiesTest002
     * @tc.desc   Disable visual properties collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetCollectVisualPropertiesTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetCollectVisualPropertiesTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETCOLLECTVISUALPROPERTIES_0300
     * @tc.name   UIAgentTreeRequestSetCollectVisualPropertiesTest003
     * @tc.desc   Set visual properties collection with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentTreeRequestSetCollectVisualPropertiesTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetCollectVisualPropertiesTest003()).assertEqual(0)
      done()
    })
  })

  describe('UIAgentTreeRequestSetCollectFunctionalPropertiesTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETCOLLECTFUNCTIONALPROPERTIES_0100
     * @tc.name   UIAgentTreeRequestSetCollectFunctionalPropertiesTest001
     * @tc.desc   Enable functional properties collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetCollectFunctionalPropertiesTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetCollectFunctionalPropertiesTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETCOLLECTFUNCTIONALPROPERTIES_0200
     * @tc.name   UIAgentTreeRequestSetCollectFunctionalPropertiesTest002
     * @tc.desc   Disable functional properties collection on full tree request, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentTreeRequestSetCollectFunctionalPropertiesTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetCollectFunctionalPropertiesTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTTREEREQUESTSETCOLLECTFUNCTIONALPROPERTIES_0300
     * @tc.name   UIAgentTreeRequestSetCollectFunctionalPropertiesTest003
     * @tc.desc   Set functional properties collection with null request, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentTreeRequestSetCollectFunctionalPropertiesTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentTreeRequestSetCollectFunctionalPropertiesTest003()).assertEqual(0)
      done()
    })
  })
}
