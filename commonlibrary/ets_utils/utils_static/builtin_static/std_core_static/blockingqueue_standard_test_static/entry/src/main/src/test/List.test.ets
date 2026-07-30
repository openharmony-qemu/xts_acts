'use static'

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

import blockingQueueConstructorTest from './blockingqueue/BlockingQueueConstructorTest.test';
import blockingQueuePushTest from './blockingqueue/BlockingQueuePushTest.test';
import blockingQueuePopTest from './blockingqueue/BlockingQueuePopTest.test';
import blockingQueueAddTest from './blockingqueue/BlockingQueueAddTest.test';
import blockingQueuePollTest from './blockingqueue/BlockingQueuePollTest.test';
import blockingQueueGetFirstTest from './blockingqueue/BlockingQueueGetFirstTest.test';
import blockingQueueIsEmptyTest from './blockingqueue/BlockingQueueIsEmptyTest.test';
import blockingQueueRemainingCapacityTest from './blockingqueue/BlockingQueueRemainingCapacityTest.test';
import blockingQueueGetEndTest from './blockingqueue/BlockingQueueGetEndTest.test';
import blockingQueuePropertyTest from './blockingqueue/BlockingQueuePropertyTest.test';
import blockingQueueComprehensiveTest from './blockingqueue/BlockingQueueComprehensiveTest.test';
import blockingQueueEdgeCaseTest from './blockingqueue/BlockingQueueEdgeCaseTest.test';
import blockingQueueChainTest from './blockingqueue/BlockingQueueChainTest.test';
import blockingQueueGenericTest from './blockingqueue/BlockingQueueGenericTest.test';
import blockingQueueIterableVariantTest from './blockingqueue/BlockingQueueIterableVariantTest.test';
import blockingQueueAlgebraicTest from './blockingqueue/BlockingQueueAlgebraicTest.test';
import blockingQueueBoundaryTest from './blockingqueue/BlockingQueueBoundaryTest.test';
import blockingQueueStateTransitionTest from './blockingqueue/BlockingQueueStateTransitionTest.test';
import blockingQueueDataIntegrityTest from './blockingqueue/BlockingQueueDataIntegrityTest.test';

export default function testsuite(): void {

  blockingQueueConstructorTest();
  blockingQueuePushTest();
  blockingQueuePopTest();
  blockingQueueAddTest();
  blockingQueuePollTest();
  blockingQueueGetFirstTest();
  blockingQueueIsEmptyTest();
  blockingQueueRemainingCapacityTest();
  blockingQueueGetEndTest();
  blockingQueuePropertyTest();
  blockingQueueComprehensiveTest();
  blockingQueueEdgeCaseTest();
  blockingQueueChainTest();
  blockingQueueGenericTest();
  blockingQueueIterableVariantTest();
  blockingQueueAlgebraicTest();
  blockingQueueBoundaryTest();
  blockingQueueStateTransitionTest();
  blockingQueueDataIntegrityTest();

}
