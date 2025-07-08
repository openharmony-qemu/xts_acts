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

import scrollAniFalse from './ScrollTest/scrollAniFalse.test';
import scrollAniUn from './ScrollTest/scrollAniUn.test';
import scrollAniTrue from './ScrollTest/scrollAniTrue.test';
import enableScrollJsunit from './ScrollBarTest/enableScrollJsunit.test';
import scrollAniFalse from './ScrollTest/scrollAniFalse.test';
import scrollAniUn from './ScrollTest/scrollAniUn.test';
import scrollAniTrue from './ScrollTest/scrollAniTrue.test';
import gridAniTrue from './GridTest/gridAniTrue.test';
import irregularAniGrid from './GridTest/irregularAniGrid.test';
import repeatAniGrid from './GridTest/repeatAniGrid.test';
import gridNode from './GridTest/gridNode.test';
import griditemNode from './GridItemTest/griditemNode.test';
import nodeTypeGrid from './GridTest/nodeTypeGrid.test';
import listScrollerBar from './ScrollBarTest/listScrollerBar.test';
import cachedShowGrid from './GridTest/cachedShowGrid.test';
export default function testsuite() {
  scrollAniFalse();
  scrollAniUn();
  scrollAniTrue();
  enableScrollJsunit();
  scrollAniFalse();
  scrollAniUn();
  scrollAniTrue();
  gridAniTrue();
  irregularAniGrid();
  repeatAniGrid();
  gridNode();
  griditemNode();
  nodeTypeGrid();
  listScrollerBar();
  cachedShowGrid();
}