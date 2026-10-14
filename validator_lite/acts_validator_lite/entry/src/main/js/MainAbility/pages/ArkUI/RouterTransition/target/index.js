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

const DEFAULT_BACK = 'pages/ArkUI/RouterTransition/index/index';

// Builds the verdict sentence the probe page shows: it spells out how the engine is expected to
// treat the requested values, which is what the operator judges against. It matters most for the
// boundary cases - 5000 and 5001 both animate for 5s, so the duration alone cannot tell them apart
// and only the "should animate / should switch instantly" wording can.
function buildExpect(req, eff, why) {
  if (why === 'bad-animation') {
    return '未提供有效的 animation 对象（缺失 / null / 非对象）→ 应瞬间切换、无过渡。';
  }
  if (why === 'bad-type') {
    return 'type 非法或缺失 → 引擎降级为无动效（仅打 WARN）→ 应瞬间切换、无过渡。';
  }
  if (why === 'zeroed') {
    return '请求 duration=' + req + 'ms → 引擎归一为 0 → 应瞬间切换、无过渡。';
  }
  if (why === 'clamped-max') {
    return '请求 duration=' + req + 'ms → 超上限、截断为 ' + eff + 'ms 仍播放 → 应看到约 5s 的完整动效，而不是瞬间切换。';
  }
  if (why === 'default-duration') {
    return '未提供 duration（或非数字）→ 取默认 ' + eff + 'ms → 应看到一段短动效，而不是瞬间切换。';
  }
  return '请求 duration=' + req + 'ms → 应看到约 ' + eff + 'ms 的动效。';
}

export default {
  data: {
    type: '',
    msg: ''
  },
  onInit() {
    let p = {};
    if (typeof $page !== 'undefined' && $page) {
      p = $page;
    }
    // NOTE: deliberately chained getApp().data.xxx rather than holding $app in a
    // local: binding `.data` (not `$app`) releases the $app temporary at the end
    // of the statement.
    const appData = getApp().data;
    // prefer the app-level store: the caller always writes the selected type
    // there, while $page has not been observed to arrive reliably
    this._type = appData.routerType || p.type || '';
    // routerDuration === 0 is how the caller marks "this case must NOT animate"
    // (invalid type, duration 0/negative, or no animation member at all). It is
    // deliberately checked before the >0 test below, otherwise 0 would fall through
    // to the 800ms default and we would claim an animation just played when none
    // was requested.
    if (appData.routerDuration === 0) {
      this._duration = 0;
    } else if (typeof appData.routerDuration === 'number' && appData.routerDuration > 0) {
      this._duration = appData.routerDuration;
    } else {
      this._duration = (typeof p.duration === 'number' && p.duration > 0) ? p.duration : 800;
    }
    this._expect = buildExpect(appData.routerReq, this._duration, appData.routerWhy || 'ok');
    this._back = p.back || DEFAULT_BACK;
    // not part of `data`: whether leaving this page is allowed yet
    this._ready = false;
    this._pendingBack = false;
    this.type = this._type;
    this.msg = '';
  },
  onShow() {
    // The new page is shown at the START of the page transition, so a replace
    // issued while the animation is still running is ignored by the engine.
    // Only allow leaving after the animation has finished.
    const self = this;
    this._ready = false;
    this.msg = '【预期】' + this._expect;
    clearTimeout(this._timer);
    this._timer = setTimeout(function() {
      self._ready = true;
      self.msg = '【预期】' + self._expect + '  相符→pass，不符→fail';
      if (self._pendingBack) {
        self._pendingBack = false;
        router.replace({ uri: self._back });
      }
    }, this._duration + 300);
  },
  onDestroy() {
    clearTimeout(this._timer);
  },
  backClicked() {
    if (this._ready) {
      router.replace({ uri: this._back });
      return;
    }
    // the engine drops replace calls issued while the transition is running, so
    // queue this one rather than losing the tap; onShow's timer acts on it
    this._pendingBack = true;
  }
};
