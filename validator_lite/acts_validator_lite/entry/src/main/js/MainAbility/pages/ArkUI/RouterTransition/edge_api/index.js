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
import { createRouterTransitionPage } from '../../../../common/js/router_transition';

const BACK_URI = 'pages/ArkUI/RouterTransition/edge_api/index';
const DURATION = 800;

// Case table. Every item here is a malformed or boundary parameter combination; how the mode/anim/
// req/eff/why fields are turned into the engine call is documented in common/js/router_transition.js.
const ROWS = [
  // ---- the animation member itself ----
  // No animation member at all
  { key: 'router_edge_no_anim', code: 'na', mode: 'omit', type: 'none',
    req: null, eff: 0, why: 'bad-animation' },
  // Explicit null: jerry_value_is_object(null) is false, so this takes a different branch from
  // leaving the member out
  { key: 'router_edge_anim_null', code: 'an', mode: 'null', type: 'none',
    req: null, eff: 0, why: 'bad-animation' },
  // A non-object is rejected by the same !jerry_value_is_object check
  { key: 'router_edge_anim_not_object', code: 'no', mode: 'string', type: 'none',
    req: null, eff: 0, why: 'bad-animation' },
  // ---- the type member ----
  // ParseTransitionType returns UNKNOWN for an unknown name, so nothing animates (engine logs a WARN)
  { key: 'router_edge_bad_type', code: 'bt', mode: 'raw',
    anim: { type: 'fade_x', duration: DURATION }, req: DURATION, eff: 0, why: 'bad-type' },
  // MallocStringOf yields nullptr when the member is absent -> UNKNOWN -> nothing animates
  { key: 'router_edge_type_missing', code: 'tm', mode: 'raw',
    anim: { duration: DURATION }, req: DURATION, eff: 0, why: 'bad-type' },
  // ---- interface alias ----
  // router.replaceUrl maps to the same RouterModule::Replace, so it has to parse the animation too.
  // The type must be given explicitly: the default branch derives it from the key, and this key
  // (router_edge_replace_url -> edge_replace_url) is not one of the 10 valid types, so it would be
  // parsed as UNKNOWN and nothing would animate while the probe page still promised about 800ms.
  // scale rather than fade: both pages use a #000000 container, so a cross-fade between them is
  // invisible.
  { key: 'router_edge_replace_url', code: 'ru', mode: 'normal', type: 'scale', viaReplaceUrl: true },
];

export default createRouterTransitionPage({ rows: ROWS, backUri: BACK_URI, duration: DURATION });
