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

const BACK_URI = 'pages/ArkUI/RouterTransition/edge_duration/index';
// Every row of this group states its own eff/req, so DURATION is only the fallback value (taken by
// the two rows whose req is null) and takes no part in any verdict.
const DURATION = 800;

// Case table. All 9 items use mode 'raw' with an explicit anim object, always of type scale; they
// differ only in the duration they request.
const ROWS = [
  // ---- duration values ----
  // scale rather than fade throughout this group: the list page and the probe page share the same
  // palette (#000000 container, #1c1c1c cards), so a cross-fade between them keeps the screen black
  // with only faint ghosting of the bright text - 300ms is practically invisible, and 5s can only be
  // judged as "something happened / nothing", which would blur exactly the clamping, zeroing and
  // defaulting this group exists to verify. scale moves geometry and stays obvious under the same
  // palette, and the group verifies duration parsing rather than the animation type, so the type
  // does not affect any verdict.
  //
  // 0: IsValid() requires duration > 0, so nothing animates
  { key: 'router_edge_dur_zero', code: 'dz', mode: 'raw',
    anim: { type: 'scale', duration: 0 }, req: 0, eff: 0, why: 'zeroed' },
  // Negative: clamped to 0 while parsing, so nothing animates
  { key: 'router_edge_dur_negative', code: 'dn', mode: 'raw',
    anim: { type: 'scale', duration: -1 }, req: -1, eff: 0, why: 'zeroed' },
  // Sub-millisecond (0,1): static_cast<uint16_t> truncates it to 0, so nothing animates
  // (a different branch from the negative case)
  { key: 'router_edge_dur_sub_ms', code: 'sm', mode: 'raw',
    anim: { type: 'scale', duration: 0.5 }, req: 0.5, eff: 0, why: 'zeroed' },
  // Inside the boundary: exactly at the ceiling, no clamping, plays for 5000ms
  { key: 'router_edge_dur_bound_max', code: 'bm', mode: 'raw',
    anim: { type: 'scale', duration: 5000 }, req: 5000, eff: 5000, why: 'ok' },
  // Outside the boundary by 1ms: clamped to 5000 and still played (a degradation, not a rejection)
  { key: 'router_edge_dur_just_over', code: 'jo', mode: 'raw',
    anim: { type: 'scale', duration: 5001 }, req: 5001, eff: 5000, why: 'clamped-max' },
  // Far above the ceiling: same branch, to check that a large clamp still behaves
  { key: 'router_edge_dur_over_max', code: 'do', mode: 'raw',
    anim: { type: 'scale', duration: 8000 }, req: 8000, eff: 5000, why: 'clamped-max' },
  // Smallest valid value: duration > 0 just holds, so the animation path is taken (1ms, i.e. instant)
  { key: 'router_edge_dur_min_valid', code: 'mv', mode: 'raw',
    anim: { type: 'scale', duration: 1 }, req: 1, eff: 1, why: 'ok' },
  // No duration: falls back to the 300ms default and still plays
  { key: 'router_edge_dur_default', code: 'dd', mode: 'raw',
    anim: { type: 'scale' }, req: null, eff: 300, why: 'default-duration' },
  // Duration is not a number (a string): takes the else branch, i.e. the 300ms default
  { key: 'router_edge_dur_not_number', code: 'nn', mode: 'raw',
    anim: { type: 'scale', duration: '800' }, req: null, eff: 300, why: 'default-duration' },
];

export default createRouterTransitionPage({ rows: ROWS, backUri: BACK_URI, duration: DURATION });
