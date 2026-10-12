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
import { createRouterTransitionPage } from '../../../common/js/router_transition';

const BACK_URI = 'pages/RouterTransition/normal/index';
const DURATION = 800;

// Case table. Every item of this group is a normal case, so a row carries nothing but its key and
// the short code used by the pass/fail buttons: no mode/anim and no req/eff/why. They all go
// through the default branch - animation = { type: <key without the router_ prefix>, duration:
// DURATION } - so the probe page expects about 800ms of animation.
// The malformed and boundary parameter combinations are built in the edge_api and edge_duration
// groups.
const ROWS = [
  { key: 'router_fade', code: 'f' },
  { key: 'router_scale', code: 's' },
  { key: 'router_slide_left', code: 'sl' },
  { key: 'router_slide_right', code: 'sr' },
  { key: 'router_slide_up', code: 'su' },
  { key: 'router_slide_down', code: 'sd' },
  { key: 'router_slide_over_left', code: 'ol' },
  { key: 'router_slide_over_right', code: 'or' },
  { key: 'router_slide_over_up', code: 'ou' },
  { key: 'router_slide_over_down', code: 'od' },
];

export default createRouterTransitionPage({ rows: ROWS, backUri: BACK_URI, duration: DURATION });
