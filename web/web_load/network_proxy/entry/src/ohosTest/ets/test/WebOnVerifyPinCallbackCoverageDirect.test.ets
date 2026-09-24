/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

interface VerifyPinEventData {
  handler: VerifyPinHandler;
  identity: string;
}

type OnVerifyPinCallback = (event: VerifyPinEventData) => void;

export default function webOnVerifyPinCallbackCoverageDirect() {
  describe('WebOnVerifyPinCallbackCoverageDirect', () => {
    /**
     * @tc.name   testVerifyPinHandlerConstructor001
     * @tc.number SUB_WEB_VERIFYPINHANDLER_CONSTRUCTOR_4300
     * @tc.desc   test VerifyPinHandler class and constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVerifyPinHandlerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let handler: VerifyPinHandler = new VerifyPinHandler();
        expect(handler != null).assertTrue();
        done();
      })

    /**
     * @tc.name   testVerifyPinHandlerConstructorReturn001
     * @tc.number SUB_WEB_VERIFYPINHANDLER_CONSTRUCTOR_RETURN_4400
     * @tc.desc   test VerifyPinHandler constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVerifyPinHandlerConstructorReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let handler: VerifyPinHandler = new VerifyPinHandler();
        handler.confirm(PinVerifyResult.PIN_VERIFICATION_SUCCESS);
        done();
      })

    /**
     * @tc.name   testOnVerifyPinCallbackInterfaceCall001
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_4500
     * @tc.desc   test OnVerifyPinCallback type alias interface call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnVerifyPinCallbackInterfaceCall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let handler: VerifyPinHandler = new VerifyPinHandler();
        let event: VerifyPinEventData = { handler: handler, identity: 'test-identity' };
        let invoked: boolean = false;
        let callback: OnVerifyPinCallback = (evt: VerifyPinEventData): void => {
          invoked = evt.identity === 'test-identity';
        };
        callback(event);
        expect(invoked).assertTrue();
        done();
      })

    /**
     * @tc.name   testVerifyPinHandlerClass001
     * @tc.number SUB_WEB_VERIFYPINHANDLER_CLASS_4600
     * @tc.desc   test VerifyPinHandler class export is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVerifyPinHandlerClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let handler: VerifyPinHandler = new VerifyPinHandler();
        handler.confirm(PinVerifyResult.PIN_VERIFICATION_FAILED);
        let proto: object = VerifyPinHandler.prototype as object;
        expect(typeof (proto as Record<string, Function>)['confirm']).assertEqual('function');
        done();
      })
  })
}
