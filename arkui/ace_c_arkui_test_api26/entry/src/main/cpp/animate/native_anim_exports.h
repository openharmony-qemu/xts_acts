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

#ifndef NATIVE_ANIM_EXPORTS_H
#define NATIVE_ANIM_EXPORTS_H

#include <napi/native_api.h>

namespace ArkUICapiTest {

napi_value NativeAnimEnum001(napi_env env, napi_callback_info info);
napi_value NativeAnimPropCreate002(napi_env env, napi_callback_info info);
napi_value NativeAnimPropDestroy003(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetFrom004(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetFrom005(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetTo006(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetTo007(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetDur008(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetDur009(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetDelay010(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetDelay011(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetCurve012(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetCurve013(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetTempo014(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetTempo015(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetAutoRev016(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetAutoRev017(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetIter018(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetIter019(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetTarget020(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetTarget021(napi_env env, napi_callback_info info);
napi_value NativeAnimPropDestroyNull022(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetFromNullAnim023(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetFromNullVal024(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetFromNullAnim025(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetFromNullOut026(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetToNullAnim027(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetToNullVal028(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetToNullAnim029(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetToNullOut030(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetDurNull031(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetDurInvalid032(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetDurNull033(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetDelayNull034(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetDelayNull035(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetCurveNull036(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetCurveNull037(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetTempoNull038(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetTempoNull039(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetAutoRevNull040(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetAutoRevNull041(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetIterNull042(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetIterNull043(napi_env env, napi_callback_info info);
napi_value NativeAnimPropSetTargetNull044(napi_env env, napi_callback_info info);
napi_value NativeAnimPropGetTargetNull045(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyCreate046(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyDestroy047(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetKeyTimes048(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetKeyTime049(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetKeyTime050(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetValue051(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetValues052(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetValue053(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetCurves054(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetCurve055(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetCurve056(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetDur057(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetDur058(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetDelay059(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetDelay060(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetTempo061(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetTempo062(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetAutoRev063(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetAutoRev064(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetIter065(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetIter066(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetTarget067(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetTarget068(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyCreateInvalid069(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyDestroyNull070(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetKeyTimesNull071(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetKeyTimeNull072(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetKeyTimeNull073(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetValueNull074(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetValuesNull075(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetValueNull076(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetCurvesNull077(napi_env env, napi_callback_info info);
napi_value NativeAnimKeySetCurveNull078(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyGetCurveNull079(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyTimingNull080(napi_env env, napi_callback_info info);
napi_value NativeAnimKeyTargetNull081(napi_env env, napi_callback_info info);
napi_value NativeAnimPathCreate082(napi_env env, napi_callback_info info);
napi_value NativeAnimPathDestroy083(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetDur084(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetDur085(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetDelay086(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetDelay087(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetCurve088(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetCurve089(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetTempo090(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetTempo091(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetAutoRev092(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetAutoRev093(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetIter094(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetIter095(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetAutoRot096(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetAutoRot097(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetTarget098(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetTarget099(napi_env env, napi_callback_info info);
napi_value NativeAnimPathCreateNull100(napi_env env, napi_callback_info info);
napi_value NativeAnimPathDestroyNull101(napi_env env, napi_callback_info info);
napi_value NativeAnimPathSetDurNull102(napi_env env, napi_callback_info info);
napi_value NativeAnimPathGetDurNull103(napi_env env, napi_callback_info info);
napi_value NativeAnimPathDelayNull104(napi_env env, napi_callback_info info);
napi_value NativeAnimPathCurveNull105(napi_env env, napi_callback_info info);
napi_value NativeAnimPathTempoNull106(napi_env env, napi_callback_info info);
napi_value NativeAnimPathAutoRevNull107(napi_env env, napi_callback_info info);
napi_value NativeAnimPathIterNull108(napi_env env, napi_callback_info info);
napi_value NativeAnimPathAutoRotNull109(napi_env env, napi_callback_info info);
napi_value NativeAnimPathTargetNull110(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupCreate111(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupDestroy112(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetDur113(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetDur114(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetDelay115(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetDelay116(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetCurve117(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetCurve118(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetTempo119(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetTempo120(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetAutoRev121(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetAutoRev122(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetIter123(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetIter124(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetFps125(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetFps126(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupRegFinish127(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupSetTarget128(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupGetTarget129(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupAddProp130(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupAddKey131(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupAddPath132(napi_env env, napi_callback_info info);
napi_value NativeAnimAddGroup133(napi_env env, napi_callback_info info);
napi_value NativeAnimHasGroup134(napi_env env, napi_callback_info info);
napi_value NativeAnimGetState135(napi_env env, napi_callback_info info);
napi_value NativeAnimRemoveGroup136(napi_env env, napi_callback_info info);
napi_value NativeAnimPauseGroup137(napi_env env, napi_callback_info info);
napi_value NativeAnimResumeGroup138(napi_env env, napi_callback_info info);
napi_value NativeAnimFinishGroup139(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupDestroyNull140(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupTimingNull141(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupCurveNull142(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupFpsNull143(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupRegNull144(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupAddNull145(napi_env env, napi_callback_info info);
napi_value NativeAnimGroupTargetNull146(napi_env env, napi_callback_info info);
napi_value NativeAnimCtxNull147(napi_env env, napi_callback_info info);
napi_value NativeAnimCtrlNull148(napi_env env, napi_callback_info info);
napi_value NativeAnimPropTrans149(napi_env env, napi_callback_info info);
napi_value NativeAnimFinishModes150(napi_env env, napi_callback_info info);

} // namespace ArkUICapiTest

#endif
