'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import MeasureJsunit from './MeasureSizeTest/MeasureJsunit.test';
import APIsetDragEventStrictReportingEnabled from './MeasureSizeTest/APIsetDragEventStrictReportingEnabled.test';
import APIgetFrameNodeByUniqueId from './MeasureSizeTest/APIgetFrameNodeByUniqueId.test';
import PageInfo1 from './PageInfo/PageInfo1.test';
import APIcomponentSnapshotGetSync from './componentSnapshot/APIcomponentSnapshotGetSync.test';
import APIUIContextGetSync from './componentSnapshot/APIUIContextGetSync.test';
import UIContextOnIdle from './OnIdle/UIContextOnIdle.test';

export default function testsuite() {
  APIcomponentSnapshotGetSync();//SDK12.6 pass1
  APIUIContextGetSync();//SDK12.6 pass1
  MeasureJsunit(); //SDK12.2 pass5
  APIsetDragEventStrictReportingEnabled();//SDK12.6 pass1
  APIgetFrameNodeByUniqueId(); // SDK10.22 pass 1
  PageInfo1();//SDK12.6 pass1
  UIContextOnIdle();//SDK12.6 fail1 记录到表格242行
}