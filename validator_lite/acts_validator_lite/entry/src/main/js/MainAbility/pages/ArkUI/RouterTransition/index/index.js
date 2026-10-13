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

// Sub-menu. Rendering all 25 RouterTransition cases at once exceeds the view node limit of this
// device (see the ACE Lite notes in DEVELOPMENT.md), so they are split into 3 group pages.
export default {
  data: {
    itemIndex: 0,
    todolist: [
      { id: 0, title: 'Normal animation types (10)', url: 'pages/ArkUI/RouterTransition/normal/index' },
      { id: 1, title: 'API and parameters (6)', url: 'pages/ArkUI/RouterTransition/edge_api/index' },
      { id: 2, title: 'Edge: duration values (9)', url: 'pages/ArkUI/RouterTransition/edge_duration/index' },
      { id: 25, title: '返回首页', url: 'pages/index/index' }
    ]
  },

  onShow() {
  },

  clickChange(item) {
    router.replace({
      uri: item.url,
      params: {
        itemIndex: item.id
      }
    });
  },

  swipeEvent(e) {
    if (e.direction === 'right') {
      router.replace({ uri: 'pages/index/index' });
    }
  },
};
