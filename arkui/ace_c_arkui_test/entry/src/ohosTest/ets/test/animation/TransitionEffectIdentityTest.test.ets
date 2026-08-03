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

export default function transitionEffectIdentityTest() {

  describe('TransitionEffectIdentityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTransitionEffectIdentity001
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0100
     * @tc.desc   testing OH_ArkUI_CreateIdentityTransitionEffect returns non-null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity002
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0200
     * @tc.desc   testing OH_ArkUI_TransitionEffect_Dispose with valid effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity003
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0300
     * @tc.desc   testing OH_ArkUI_TransitionEffect_Dispose with null effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity004
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0400
     * @tc.desc   testing OH_ArkUI_TransitionEffect_Combine with valid effects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity005
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0500
     * @tc.desc   testing OH_ArkUI_TransitionEffect_Combine with null firstEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity006
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0600
     * @tc.desc   testing OH_ArkUI_TransitionEffect_Combine with null secondEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity007
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0700
     * @tc.desc   testing OH_ArkUI_TransitionEffect_Combine with both null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity008
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0800
     * @tc.desc   testing OH_ArkUI_TransitionEffect_SetAnimation with valid params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity009
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_0900
     * @tc.desc   testing OH_ArkUI_TransitionEffect_SetAnimation with null effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity010
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_1000
     * @tc.desc   testing OH_ArkUI_TransitionEffect_SetAnimation with null animation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity011
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_1100
     * @tc.desc   testing OH_ArkUI_TransitionEffect_SetAnimation with both null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity012
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_1200
     * @tc.desc   testing set identity effect on NODE_TRANSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTransitionEffectIdentity013
     * @tc.number SUB_ARKUI_CAPI_TRANSITIONEFFECTIDENTITY_1300
     * @tc.desc   testing combine identity+opacity, set animation, set on node, resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransitionEffectIdentity013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTransitionEffectIdentity013()).assertEqual(0)
      done()
    })

  })
}
