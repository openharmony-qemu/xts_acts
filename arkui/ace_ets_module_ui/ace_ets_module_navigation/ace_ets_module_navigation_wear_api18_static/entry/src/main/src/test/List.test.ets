/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import EnableSwipeBackPage from './Navigation/EnableSwipeBackPage.test'
import EnableSwipeBackRouter from './router/EnableSwipeBackRouter.test'
export default function testsuite() {
  EnableSwipeBackPage()  // (page53)consume 造成页面加载失败，导致（test91）无法获取component 2个用例
  EnableSwipeBackRouter()   // 用例2 app died   （page29）没有this.getUIContext().enableSwipeBack 造成 appDied
}