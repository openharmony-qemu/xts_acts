/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router_getStateByUrl1 from './router/router_getStateByUrl1.test'
import router_getStateByIndex3 from './router/router_getStateByIndex3.test'
import replaceNamedRoute8 from './router/replaceNamedRoute/replaceNamedRoute8.test'
import clear1 from './router/clear/clear1.test'
import getState1 from './router/getState/getState1.test'
import pushNamedRoute6 from './router/pushNamedRoute/pushNamedRoute6.test'

export default function testsuite() {
  router_getStateByUrl1();
  router_getStateByIndex3();
  replaceNamedRoute8();
  clear1();
  getState1();
  pushNamedRoute6();
}