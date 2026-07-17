/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import appStorageNullUndefinedTest from './nullUndefined/AppStorageNullUndefined.test';
import localStorageNullUndefinedTest from './nullUndefined/LocalStorageNullUndefined.test';
import environmentNullUndefinedTest from './nullUndefined/EnvironmentNullUndefined.test';
import persistentStorageNullUndefinedTest from './nullUndefined/PersistentStorageNullUndefined.test';
import appStorageV2NullUndefinedTest from './nullUndefined/AppStorageV2NullUndefined.test';
import persistenceV2NullUndefinedTest from './nullUndefined/PersistenceV2NullUndefined.test';
import uiUtilsNullUndefinedTest from './nullUndefined/UIUtilsNullUndefined.test';
import globalResNullUndefinedTest from './nullUndefined/GlobalResNullUndefined.test';
import abstractPropertyNullUndefinedTest from './nullUndefined/AbstractPropertyNullUndefined.test';
import decoratorNullUndefinedTest from './nullUndefined/DecoratorNullUndefined.test';

export default function testsuite() {
  appStorageNullUndefinedTest();
  localStorageNullUndefinedTest();
  environmentNullUndefinedTest();
  persistentStorageNullUndefinedTest();
  appStorageV2NullUndefinedTest();
  persistenceV2NullUndefinedTest();
  uiUtilsNullUndefinedTest();
  globalResNullUndefinedTest();
  abstractPropertyNullUndefinedTest();
  decoratorNullUndefinedTest();
}
