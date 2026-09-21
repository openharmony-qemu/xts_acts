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
import router from '@system.router';

// Shared page logic for the three RouterTransition group pages (normal / edge_api / edge_duration).
// Exported as a factory rather than a shared object: each page needs its own `data` and its own
// pass/fail state, and one shared object would let the pages overwrite each other's colours.
const TARGET_URI = 'pages/RouterTransition/target/index';
const MENU_URI = 'pages/RouterTransition/index/index';
const ROUTER_KEY_PREFIX = 'router_';
const COLOR_PASS = '#4caf50';
const COLOR_FAIL = '#f44336';
const COLOR_IDLE = '#555555';
// Fallback for a ROWS entry that omits req/eff, and the duration of the default animation branch
const DEFAULT_DURATION = 800;

function findRow(rows, key) {
  for (let i = 0; i < rows.length; i++) {
    if (rows[i].key === key) {
      return rows[i];
    }
  }
  return null;
}

// Builds the page `data` from ROWS. The generated names must match the
// {{<code>PassColor}} / {{<code>FailColor}} bindings in the page's hml file.
function buildColorData(rows) {
  const data = {};
  for (let i = 0; i < rows.length; i++) {
    const code = rows[i].code;
    data[code + 'PassColor'] = COLOR_IDLE;
    data[code + 'FailColor'] = COLOR_IDLE;
  }
  return data;
}

// Maps the pass/fail results kept in the app-level store back onto this page's button colours.
// Coming back from the probe page rebuilds this page through router.replace, which resets its
// `data`, while the stored results survive.
//
// This has to run from onInit and not only from onShow: onShow runs after the list has been laid
// out, so rows still off-screen have not been created yet and the assignment never reaches them.
// They would stay grey until scrolled into view.
function restoreColors(page, rows) {
  const items = getApp().data.testItems;
  for (let i = 0; i < rows.length; i++) {
    const row = rows[i];
    const item = items[row.key];
    const status = (item && item.status) ? item.status : 'null';
    page[row.code + 'PassColor'] = (status === 'pass') ? COLOR_PASS : COLOR_IDLE;
    page[row.code + 'FailColor'] = (status === 'fail') ? COLOR_FAIL : COLOR_IDLE;
  }
}

// Switches to the probe page with this row's animation so the operator can watch the real page
// transition. The engine reads the transition config from a top-level "animation" member
// (RouterModule::ParseAnimationConfig); anything put under "params" is ignored and the switch
// silently falls back to no animation.
//
// `null` must not be collapsed into the default branch by a truthiness test: `row.anim ? A : B`
// would send an animation for the "no animation member" cases and silently void those cases.
function playTransition(row, key, backUri, duration) {
  const mode = row.mode || 'normal';
  let type;
  let anim;
  if (mode === 'omit' || mode === 'null' || mode === 'string') {
    type = row.type || 'none';
    anim = null;
  } else if (mode === 'raw') {
    type = row.anim.type || 'none';
    anim = row.anim;
  } else {
    // row.type wins over the key: most keys are the type name behind the router_ prefix, but a
    // case whose key is not a type name (router_edge_replace_url -> edge_replace_url) would be
    // parsed as UNKNOWN by ParseTransitionType and would not animate at all.
    type = row.type || key.substring(ROUTER_KEY_PREFIX.length);
    anim = { type: type, duration: duration };
  }
  // Stashed on the app-level store because the probe page cannot rely on $page.
  // NOTE: deliberately chained getApp().data.xxx rather than holding $app in a
  // local across router.replace(): binding `.data` (not `$app`) releases the
  // $app temporary at the end of the statement.
  //
  // eff - the duration the engine ends up with (the boundary cases rely on it to express
  //       "clamped" / "zeroed"); req - the requested one, so the probe page can show
  //       "requested -> effective"; why - the branch the engine is expected to take, which
  //       selects the verdict text the probe page renders.
  getApp().data.routerType = type;
  getApp().data.routerDuration = (typeof row.eff === 'number') ? row.eff : duration;
  getApp().data.routerReq = (typeof row.req === 'number') ? row.req : duration;
  getApp().data.routerWhy = row.why || 'ok';
  const routeOptions = {
    uri: TARGET_URI,
    params: { key: key, back: backUri }
  };
  if (mode === 'null') {
    routeOptions.animation = null;
  } else if (mode === 'string') {
    routeOptions.animation = 'fade';
  } else if (anim !== null) {
    routeOptions.animation = anim;
  }
  if (row.viaReplaceUrl) {
    router.replaceUrl(routeOptions);
  } else {
    router.replace(routeOptions);
  }
}

// pass and fail are mutually exclusive: tapping one side records that result and resets the other
// side to grey, and tapping the side that is already recorded clears the result.
// `page` is passed in because a module-level function has no `this`; the page methods hand over
// the page view model.
function toggleStatus(page, rows, key, target) {
  const row = findRow(rows, key);
  if (!row) {
    return;
  }
  const items = getApp().data.testItems;
  const same = (items[key].status === target);
  items[key].status = same ? 'null' : target;
  const onColor = (target === 'pass') ? COLOR_PASS : COLOR_FAIL;
  const onSuffix = (target === 'pass') ? 'PassColor' : 'FailColor';
  const offSuffix = (target === 'pass') ? 'FailColor' : 'PassColor';
  page[row.code + onSuffix] = same ? COLOR_IDLE : onColor;
  page[row.code + offSuffix] = COLOR_IDLE;
}

export function createRouterTransitionPage(pageOptions) {
  const rows = pageOptions.rows;
  const backUri = pageOptions.backUri;
  const duration = (typeof pageOptions.duration === 'number') ? pageOptions.duration : DEFAULT_DURATION;
  return {
    data: buildColorData(rows),
    // onInit runs before RenderPage(), so the rows already bind to the right colour as the list
    // creates them (see restoreColors).
    onInit() {
      restoreColors(this, rows);
    },
    // Kept as a fallback: onInit does not run again when the page is resumed from background.
    onShow() {
      restoreColors(this, rows);
    },
    play(key) {
      const row = findRow(rows, key);
      if (!row) {
        return;
      }
      playTransition(row, key, backUri, duration);
    },
    togglePass(key) {
      toggleStatus(this, rows, key, 'pass');
    },
    toggleFail(key) {
      toggleStatus(this, rows, key, 'fail');
    },
    backClicked() {
      router.replace({ uri: MENU_URI });
    }
  };
}
