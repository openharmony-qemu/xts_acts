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
import frameNodeIsVisibleTest from './FrameNodeTest/frameNodeIsVisible.test';
import frameNodeMoveOneTest from './FrameNodeTest/frameNodeMoveOne.test';
import frameNodeMoveTwoTest from './FrameNodeTest/frameNodeMoveTwo.test';
import frameNodeMoveToErrorCodeTest from './FrameNodeTest/frameNodeMoveToErrorCode.test';
import AddComponentContentErrorCodeTest from './FrameNodeTest/AddComponentContentErrorCode.test';
import BindControllerErrorCodeTest from './FrameNodeTest/BindControllerErrorCode.test';
import RenderNodeDisposeTest from './FrameNodeTest/RenderNodeDispose.test';
import componentContentDisposeTest from './FrameNodeTest/componentContentDispose.test';
import blendColorErrorCodeTest from './FrameNodeTest/blendColorErrorCode.test';
import resourceColorErrorCodeTest from './FrameNodeTest/resourceColorErrorCode.test';
import setCrossLanguageOptionsErrorCodeTest from './FrameNodeTest/setCrossLanguageOptionsErrorCode.test';
import postFrameCallbackTest from './PostFrameTest/postFrameCallback.test';

export default function testsuite() {
  // blendColorErrorCodeTest(); // Failure: 1  sourceColor.blendColor(null)编译不过 用例注释掉
  // resourceColorErrorCodeTest(); // Failure: 1  sourceColor.blendColor(null)编译不过 用例注释掉
  // postFrameCallbackTest(); //SDK12.9 表格120行1
  // frameNodeIsVisibleTest(); //SDK12.9 pass 1
  // frameNodeMoveOneTest(); //SDK12.9 表格122行2
  // frameNodeMoveTwoTest(); //SDK12.9 表格122行1
  // frameNodeMoveToErrorCodeTest(); //SDK12.9 表格104行1
  // AddComponentContentErrorCodeTest(); ////SDK12.9 表格104行1
  // BindControllerErrorCodeTest();//SDK12.9 表格104行11
  // RenderNodeDisposeTest();//SDK12.9 表格104行11
  // componentContentDisposeTest();//SDK12.9 表格104行11
  setCrossLanguageOptionsErrorCodeTest();//SDK12.9 表格104行11
}