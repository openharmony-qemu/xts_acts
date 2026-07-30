'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import MessageOtherTest from './message/MessageOtherTest.test';
import MessageConstructorCallbackTest from './message/MessageConstructorCallbackTest.test';
import MessageConstructorHandlerTest from './message/MessageConstructorHandlerTest.test';
import MessageConstructorWhatObjTest from './message/MessageConstructorWhatObjTest.test';
import MessageConstructorWhatTest from './message/MessageConstructorWhatTest.test';
import MessageEqualsTest from './message/MessageEqualsTest.test';
import MessageGetCallbackTest from './message/MessageGetCallbackTest.test';
import MessageGetObjectTest from './message/MessageGetObjectTest.test';
import MessageGetTargetTest from './message/MessageGetTargetTest.test';
import MessageGetWhatTest from './message/MessageGetWhatTest.test';
import MessageSendToTargetTest from './message/MessageSendToTargetTest.test';
import MessageHandlerConstructorTest from './messageHandler/MessageHandlerConstructorTest.test';
import MessageHandlerGetWorkerTest from './messageHandler/MessageHandlerGetWorkerTest.test';
import MessageHandlerHasCallbacksTest from './messageHandler/MessageHandlerHasCallbacksTest.test';
import MessageHandlerHasMessagesWhatObjTest from './messageHandler/MessageHandlerHasMessagesWhatObjTest.test';
import MessageHandlerHasMessagesWhatTest from './messageHandler/MessageHandlerHasMessagesWhatTest.test';
import MessageHandlerPostTest from './messageHandler/MessageHandlerPostTest.test';
import MessageHandlerRemoveCallbacksTest from './messageHandler/MessageHandlerRemoveCallbacksTest.test';
import MessageHandlerRemoveMessagesWhatObjTest from './messageHandler/MessageHandlerRemoveMessagesWhatObjTest.test';
import MessageHandlerRemoveMessagesWhatTest from './messageHandler/MessageHandlerRemoveMessagesWhatTest.test';
import MessageHandlerSendEmptyMessageTest from './messageHandler/MessageHandlerSendEmptyMessageTest.test';
import MessageHandlerSendMessageTest from './messageHandler/MessageHandlerSendMessageTest.test';

export default function testsuite(): void {
  MessageOtherTest();
  MessageConstructorCallbackTest();
  MessageConstructorHandlerTest();
  MessageConstructorWhatObjTest();
  MessageConstructorWhatTest();
  MessageEqualsTest();
  MessageGetCallbackTest();
  MessageGetObjectTest();
  MessageGetTargetTest();
  MessageGetWhatTest();
  MessageSendToTargetTest();
  MessageHandlerConstructorTest();
  MessageHandlerGetWorkerTest();
  MessageHandlerHasCallbacksTest();
  MessageHandlerHasMessagesWhatObjTest();
  MessageHandlerHasMessagesWhatTest();
  MessageHandlerPostTest();
  MessageHandlerRemoveCallbacksTest();
  MessageHandlerRemoveMessagesWhatObjTest();
  MessageHandlerRemoveMessagesWhatTest();
  MessageHandlerSendEmptyMessageTest();
  MessageHandlerSendMessageTest();
}
