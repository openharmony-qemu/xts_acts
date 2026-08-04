'use static';
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
import errorConstructorTest from "./error/ErrorConstructorTest.test";
import errorPropertyTest from "./error/ErrorPropertyTest.test";
import errorDollarInvokeTest from "./error/ErrorDollarInvokeTest.test";
import errorToStringTest from "./error/ErrorToStringTest.test";
import errorThrowCatchTest from "./error/ErrorThrowCatchTest.test";
import errorBuiltinSubclassTest from "./error/ErrorBuiltinSubclassTest.test";
import errorCollectionTest from "./error/ErrorCollectionTest.test";
import errorBoundaryTest from "./error/ErrorBoundaryTest.test";
import errorBehaviorInteractionTest from "./error/ErrorInteractionTest.test";
import errorSubclassFullTest from "./error/ErrorSubclassTest.test";
import errorCauseTest from "./error/ErrorCauseTest.test";
import errorBoundary2Test from "./error/ErrorBoundary2Test.test";
import errorAggregateConstructorTest from "./error/ErrorAggregateConstructorTest.test";
import errorAggregateInvokeExtraTest from "./error/ErrorAggregateInvokeTest.test";

export default function testsuite(): void {
  errorConstructorTest();
  errorPropertyTest();
  errorDollarInvokeTest();
  errorToStringTest();
  errorThrowCatchTest();
  errorBuiltinSubclassTest();
  errorCollectionTest();
  errorBoundaryTest();
  errorBehaviorInteractionTest();
  errorSubclassFullTest();
  errorCauseTest();
  errorBoundary2Test();
  errorAggregateConstructorTest();
  errorAggregateInvokeExtraTest();
}
