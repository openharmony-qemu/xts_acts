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

export default function nativeModuleAnimationTest() {
  describe('nativeModuleAnimationTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0001
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0001
     * @tc.desc   Cover animation enums and error codes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0001', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimEnum001()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0002
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0002
     * @tc.desc   PropertyAnimation_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0002', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropCreate002()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0003
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0003
     * @tc.desc   PropertyAnimation_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0003', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropDestroy003()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0004
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0004
     * @tc.desc   PropertyAnimation_SetFromValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0004', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetFrom004()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0005
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0005
     * @tc.desc   PropertyAnimation_GetFromValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0005', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetFrom005()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0006
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0006
     * @tc.desc   PropertyAnimation_SetToValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0006', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetTo006()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0007
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0007
     * @tc.desc   PropertyAnimation_GetToValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0007', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetTo007()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0008
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0008
     * @tc.desc   PropertyAnimation_SetDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0008', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetDur008()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0009
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0009
     * @tc.desc   PropertyAnimation_GetDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0009', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetDur009()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0010
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0010
     * @tc.desc   PropertyAnimation_SetDelay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0010', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetDelay010()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0011
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0011
     * @tc.desc   PropertyAnimation_GetDelay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0011', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetDelay011()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0012
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0012
     * @tc.desc   PropertyAnimation_SetCurve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0012', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetCurve012()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0013
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0013
     * @tc.desc   PropertyAnimation_GetCurve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0013', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetCurve013()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0014
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0014
     * @tc.desc   PropertyAnimation_SetTempo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0014', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetTempo014()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0015
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0015
     * @tc.desc   PropertyAnimation_GetTempo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0015', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetTempo015()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0016
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0016
     * @tc.desc   PropertyAnimation_SetAutoReverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0016', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetAutoRev016()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0017
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0017
     * @tc.desc   PropertyAnimation_GetAutoReverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0017', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetAutoRev017()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0018
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0018
     * @tc.desc   PropertyAnimation_SetIterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0018', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetIter018()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0019
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0019
     * @tc.desc   PropertyAnimation_GetIterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0019', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetIter019()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0020
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0020
     * @tc.desc   PropertyAnimation_SetTargetNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0020', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetTarget020()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0021
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0021
     * @tc.desc   PropertyAnimation_GetTargetNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0021', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetTarget021()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0022
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0022
     * @tc.desc   PropertyAnimation_Destroy nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0022', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropDestroyNull022()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0023
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0023
     * @tc.desc   PropertyAnimation_SetFromValue nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0023', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetFromNullAnim023()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0024
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0024
     * @tc.desc   PropertyAnimation_SetFromValue nullptr value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0024', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetFromNullVal024()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0025
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0025
     * @tc.desc   PropertyAnimation_GetFromValue nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0025', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetFromNullAnim025()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0026
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0026
     * @tc.desc   PropertyAnimation_GetFromValue nullptr out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0026', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetFromNullOut026()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0027
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0027
     * @tc.desc   PropertyAnimation_SetToValue nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0027', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetToNullAnim027()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0028
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0028
     * @tc.desc   PropertyAnimation_SetToValue nullptr value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0028', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetToNullVal028()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0029
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0029
     * @tc.desc   PropertyAnimation_GetToValue nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0029', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetToNullAnim029()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0030
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0030
     * @tc.desc   PropertyAnimation_GetToValue nullptr out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0030', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetToNullOut030()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0031
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0031
     * @tc.desc   PropertyAnimation_SetDuration nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0031', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetDurNull031()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0032
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0032
     * @tc.desc   PropertyAnimation_SetDuration invalid zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0032', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetDurInvalid032()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0033
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0033
     * @tc.desc   PropertyAnimation_GetDuration nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0033', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetDurNull033()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0034
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0034
     * @tc.desc   PropertyAnimation_SetDelay nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0034', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetDelayNull034()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0035
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0035
     * @tc.desc   PropertyAnimation_GetDelay nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0035', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetDelayNull035()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0036
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0036
     * @tc.desc   PropertyAnimation_SetCurve nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0036', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetCurveNull036()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0037
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0037
     * @tc.desc   PropertyAnimation_GetCurve nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0037', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetCurveNull037()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0038
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0038
     * @tc.desc   PropertyAnimation_SetTempo nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0038', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetTempoNull038()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0039
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0039
     * @tc.desc   PropertyAnimation_GetTempo nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0039', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetTempoNull039()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0040
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0040
     * @tc.desc   PropertyAnimation_SetAutoReverse nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0040', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetAutoRevNull040()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0041
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0041
     * @tc.desc   PropertyAnimation_GetAutoReverse nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0041', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetAutoRevNull041()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0042
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0042
     * @tc.desc   PropertyAnimation_SetIterations nullptr/invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0042', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetIterNull042()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0043
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0043
     * @tc.desc   PropertyAnimation_GetIterations nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0043', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetIterNull043()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0044
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0044
     * @tc.desc   PropertyAnimation_SetTargetNode nullptr anim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0044', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropSetTargetNull044()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0045
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0045
     * @tc.desc   PropertyAnimation_GetTargetNode nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0045', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimPropGetTargetNull045()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0046
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0046
     * @tc.desc   KeyframeAnimation_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0046', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyCreate046()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0047
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0047
     * @tc.desc   KeyframeAnimation_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0047', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyDestroy047()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0048
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0048
     * @tc.desc   KeyframeAnimation_SetKeyTimes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0048', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetKeyTimes048()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0049
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0049
     * @tc.desc   KeyframeAnimation_GetKeyTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0049', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetKeyTime049()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0050
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0050
     * @tc.desc   KeyframeAnimation_SetKeyTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0050', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetKeyTime050()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0051
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0051
     * @tc.desc   KeyframeAnimation_SetValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0051', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetValue051()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0052
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0052
     * @tc.desc   KeyframeAnimation_SetValues
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0052', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetValues052()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0053
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0053
     * @tc.desc   KeyframeAnimation_GetValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0053', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetValue053()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0054
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0054
     * @tc.desc   KeyframeAnimation_SetCurves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0054', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetCurves054()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0055
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0055
     * @tc.desc   KeyframeAnimation_SetCurve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0055', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetCurve055()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0056
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0056
     * @tc.desc   KeyframeAnimation_GetCurve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0056', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetCurve056()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0057
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0057
     * @tc.desc   KeyframeAnimation_SetDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0057', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetDur057()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0058
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0058
     * @tc.desc   KeyframeAnimation_GetDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0058', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetDur058()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0059
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0059
     * @tc.desc   KeyframeAnimation_SetDelay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0059', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetDelay059()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0060
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0060
     * @tc.desc   KeyframeAnimation_GetDelay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0060', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetDelay060()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0061
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0061
     * @tc.desc   KeyframeAnimation_SetTempo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0061', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetTempo061()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0062
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0062
     * @tc.desc   KeyframeAnimation_GetTempo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0062', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetTempo062()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0063
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0063
     * @tc.desc   KeyframeAnimation_SetAutoReverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0063', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetAutoRev063()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0064
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0064
     * @tc.desc   KeyframeAnimation_GetAutoReverse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0064', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetAutoRev064()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0065
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0065
     * @tc.desc   KeyframeAnimation_SetIterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0065', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetIter065()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0066
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0066
     * @tc.desc   KeyframeAnimation_GetIterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0066', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetIter066()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0067
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0067
     * @tc.desc   KeyframeAnimation_SetTargetNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0067', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetTarget067()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0068
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0068
     * @tc.desc   KeyframeAnimation_GetTargetNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0068', Level.LEVEL1, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetTarget068()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0069
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0069
     * @tc.desc   KeyframeAnimation_Create invalid size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0069', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyCreateInvalid069()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0070
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0070
     * @tc.desc   KeyframeAnimation_Destroy nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0070', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyDestroyNull070()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0071
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0071
     * @tc.desc   KeyframeAnimation_SetKeyTimes nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0071', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetKeyTimesNull071()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0072
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0072
     * @tc.desc   KeyframeAnimation_GetKeyTime nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0072', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeyGetKeyTimeNull072()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0073
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0073
     * @tc.desc   KeyframeAnimation_SetKeyTime nullptr/OOB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0073', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetKeyTimeNull073()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0074
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0074
     * @tc.desc   KeyframeAnimation_SetValue nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0074', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetValueNull074()).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0075
     * @tc.number SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0075
     * @tc.desc   KeyframeAnimation_SetValues nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_CAPI_NATIVE_MODULE_ANIM_0075', Level.LEVEL2, async (done: Function) => {
      expect(nativeAnim.NativeAnimKeySetValuesNull075()).assertEqual(0);
      done();
    });

  });
}
