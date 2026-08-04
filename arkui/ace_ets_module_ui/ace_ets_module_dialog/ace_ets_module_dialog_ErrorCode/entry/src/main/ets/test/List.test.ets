/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import ShowDialogErrorCodeTest from './dialogErrorCode/ShowDialogErrorCodeTest.test';
import ShowAlertDialogErrorCodeTest from './dialogErrorCode/ShowAlertDialogErrorCodeTest.test';
import ShowActionMenuErrorCodeTest from './dialogErrorCode/ShowActionMenuErrorCodeTest.test';
import ShowActionSheetErrorCodeTest from './dialogErrorCode/ShowActionSheetErrorCodeTest.test';
import OpenCustomDialogErrorCodeTest from './dialogErrorCode/OpenCustomDialogErrorCodeTest.test';
import PresentCustomDialogErrorCodeTest from './dialogErrorCode/PresentCustomDialogErrorCodeTest.test';
import OpenCustomDialogWithControllerErrorCodeTest
  from './dialogErrorCode/OpenCustomDialogWithControllerErrorCodeTest.test';
import UpdateCustomDialogErrorCodeTest from './dialogErrorCode/UpdateCustomDialogErrorCodeTest.test';
import CloseCustomDialogErrorCodeTest from './dialogErrorCode/CloseCustomDialogErrorCodeTest.test';

export default function testsuite() {
  ShowDialogErrorCodeTest();
  ShowAlertDialogErrorCodeTest();
  ShowActionMenuErrorCodeTest();
  ShowActionSheetErrorCodeTest();
  OpenCustomDialogErrorCodeTest();
  PresentCustomDialogErrorCodeTest();
  OpenCustomDialogWithControllerErrorCodeTest();
  UpdateCustomDialogErrorCodeTest();
  CloseCustomDialogErrorCodeTest();
}
