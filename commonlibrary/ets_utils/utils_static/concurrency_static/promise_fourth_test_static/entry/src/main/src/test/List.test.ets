'use static'
/*
 * Copyright (c) 2026 RKH Corp.
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
import PromiseAllFirstTest from './PromiseAllFirstTest.test';
import PromiseAllSecondTest from './PromiseAllSecondTest.test';
import PromiseAllThirdTest from './PromiseAllThirdTest.test';
import PromiseAllSettledFirstTest from './PromiseAllSettledFirstTest.test';
import PromiseAllSettledSecondTest from './PromiseAllSettledSecondTest.test';
import PromiseAnyFirstTest from './PromiseAnyFirstTest.test';
import PromiseAnySecondTest from './PromiseAnySecondTest.test';
import PromiseCatchFirstTest from './PromiseCatchFirstTest.test';
import PromiseCatchSecondTest from './PromiseCatchSecondTest.test';
import PromiseCatchThirdTest from './PromiseCatchThirdTest.test';
import PromiseCatchFourthTest from './PromiseCatchFourthTest.test';
import PromiseFinallyTest from './PromiseFinallyTest.test';
import PromiseRaceFirstTest from './PromiseRaceFirstTest.test';
import PromiseRaceSecondTest from './PromiseRaceSecondTest.test';
import PromiseThenFirstTest from './PromiseThenFirstTest.test';
import PromiseThenSecondTest from './PromiseThenSecondTest.test';
import PromiseThenThirdTest from './PromiseThenThirdTest.test';
import PromiseThenFourthTest from './PromiseThenFourthTest.test';

export default function testsuite(): void {
  PromiseAllFirstTest();
  PromiseAllSecondTest();
  PromiseAllThirdTest();
  PromiseAllSettledFirstTest();
  PromiseAllSettledSecondTest();
  PromiseAnyFirstTest();
  PromiseAnySecondTest();
  PromiseCatchFirstTest();
  PromiseCatchSecondTest();
  PromiseCatchThirdTest();
  PromiseCatchFourthTest();
  PromiseFinallyTest();
  PromiseRaceFirstTest();
  PromiseRaceSecondTest();
  PromiseThenFirstTest();
  PromiseThenSecondTest();
  PromiseThenThirdTest();
  PromiseThenFourthTest();
}
