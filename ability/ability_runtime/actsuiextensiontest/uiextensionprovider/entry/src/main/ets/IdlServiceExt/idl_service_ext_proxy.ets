/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import {addCallback} from './i_idl_service_ext';
import IIdlServiceExt from './i_idl_service_ext';
import rpc from '@ohos.rpc';


export default class IdlServiceExtProxy implements IIdlServiceExt {
    constructor(proxy: rpc.IRemoteObject) {
        this.proxy = proxy;
    }

    public add(num1: number, num2: number, callback: addCallback): void {
        let option = new rpc.MessageOption();
        let data = rpc.MessageSequence.create();
        let reply = rpc.MessageSequence.create();
        data.writeInt(num1);
        data.writeInt(num2);
        this.proxy.sendMessageRequest(IdlServiceExtProxy.COMMAND_ADD, data, reply, option).then((result) => {
            if (result.errCode === 0) {
                let errCode = result.reply.readInt();
                if (errCode != 0) {
                    let returnValue: number = 0;
                    callback(errCode, returnValue);
                    return;
                }
                let returnValue = result.reply.readInt();
                callback(errCode, returnValue);
            } else {
                console.log('sendMessageRequest failed, errCode: ' + result.errCode);
            }
        })
    }

    public static readonly COMMAND_ADD = 1;
    private proxy: rpc.IRemoteObject
}
