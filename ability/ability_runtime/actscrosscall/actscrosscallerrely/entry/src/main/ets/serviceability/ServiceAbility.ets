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
import commonEvent from '@ohos.commonEventManager'
import rpc from '@ohos.rpc';
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility'
import { BusinessError } from '@ohos.base';
import { Configuration } from '@kit.AbilityKit';
import Want from '@ohos.app.ability.Want';
import { Caller } from '@ohos.app.ability.UIAbility';

class MyParcelAble implements rpc.Parcelable {
  num: number = 0;
  str: string = '';
  result: boolean = false;

  constructor(num: number, string: string, result: boolean) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  MyParcelAble(num: number, string: string, result: boolean) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel: rpc.MessageSequence) {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeBoolean(this.result);
    return true;
  }

  unmarshalling(messageParcel: rpc.MessageSequence) {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readBoolean();
    return true;
  }
}

class StubTest extends rpc.RemoteObject {
  constructor(des: string) {
    super(des)
  }

  onRemoteRequest(code: number, data: rpc.MessageParcel, reply: rpc.MessageParcel, option: rpc.MessageOption) {
    console.info('ServiceAbility onRemoteRequest');
    if (code === 1) {
      let op1 = data.readInt();
      let op2 = data.readInt();
      reply.writeInt(op1 + op2);
      console.info('ServiceAbility op1:' + op1 + ' op2:' + op2);
    }
    return true;
  }
}
let actionStr: ESObject;
let accountId: ESObject;
let message: ESObject;
let commonEventData: commonEvent.CommonEventPublishData = {
  parameters:{
    message:message,
  }
}
let remoteOBJ = new StubTest('test');
export default class ServiceAbility extends ServiceExtensionAbility {
  onCreate(want: Want) {
    actionStr = want.parameters?.action;
    accountId = want.parameters?.accountId;
    console.info('ServiceAbility onCreate want:' + JSON.stringify(want));
    globalThis.terminate = () => {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.info('====>ServiceAbility terminateSelf end');
        }).catch((err: BusinessError) => {
          console.info('====>ServiceAbility terminateSelf err:' + JSON.stringify(err));
        });
      }, 50)
    };

    globalThis.Acts_CrossUserCall_1000 = () => {
      this.context.startAbilityByCallWithAccount(null, -1).then((caller: Caller) => {
        console.info('====>Acts_CrossUserCall_1000 caller:' + caller)
      }).catch((err: BusinessError) => {
        console.info('====>Acts_CrossUserCall_1000 err: ' + JSON.stringify(err))
        commonEventData.parameters!.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>Acts_CrossUserCall_1000 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    globalThis.Acts_CrossUserCall_1200 = () => {
      this.context.startAbilityByCallWithAccount(undefined, -1).then((caller: Caller) => {
        console.info('====>Acts_CrossUserCall_1200 caller:  ' + caller)
      }).catch((err: BusinessError) => {
        console.info('====>Acts_CrossUserCall_1200 err: ' + JSON.stringify(err))
        commonEventData.parameters!.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>Acts_CrossUserCall_1200 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    globalThis.Acts_CrossUserCall_1400 = () => {
      let want: Want = {
        bundleName: 'xxxx.xxxx.xxxx',
        abilityName: 'xxxx',
        moduleName: 'xxxxxx'
      }
      this.context.startAbilityByCallWithAccount(want, 100).then((caller: Caller) => {
        console.info('====>Acts_CrossUserCall_1400 caller: ' + caller)
      }).catch((err: BusinessError) => {
        console.info('====>Acts_CrossUserCall_1400 err: ' + JSON.stringify(err))
        commonEventData.parameters!.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>Acts_CrossUserCall_1400 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    globalThis.Acts_CrossUserCall_1600 = () => {
      let want: Want = {
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
        moduleName: 'entry'
      }
      this.context.startAbilityByCallWithAccount(want, null).then((caller: Caller) => {
        console.info('====>Acts_CrossUserCall_1600 caller  ' + JSON.stringify(caller))
      }).catch((err: BusinessError) => {
        console.info('====>Acts_CrossUserCall_1600 err: ' + JSON.stringify(err))
        commonEventData.parameters!.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>Acts_CrossUserCall_1600 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    globalThis.Acts_CrossUserCall_1800 = () => {
      let want: Want = {
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
        moduleName: 'entry'
      }
      this.context.startAbilityByCallWithAccount(want, undefined).then((caller: Caller) => {
        console.info('====>Acts_CrossUserCall_1800 caller: ' + caller)
      }).catch((err: BusinessError) => {
        console.info('====>Acts_CrossUserCall_1800 err: ' + JSON.stringify(err))
        commonEventData.parameters!.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>Acts_CrossUserCall_1800 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    globalThis.Acts_CrossUserCall_2000 = () => {
      let want: Want = {
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
        moduleName: 'entry'
      }
      this.context.startAbilityByCallWithAccount(want, 9527).then((caller: Caller) => {
        console.info('====>Acts_CrossUserCall_2000 caller: ' + caller)
      }).catch((err: BusinessError) => {
        console.info('====>Acts_CrossUserCall_2000 err: ' + JSON.stringify(err));
        commonEventData.parameters!.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>Acts_CrossUserCall_2000 publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    if (actionStr == 'Acts_CrossUserCall_0200' || actionStr == 'Acts_CrossUserCall_0400') {
      this.context.startAbilityByCallWithAccount({
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
      }, accountId).then((data: ESObject) => {
        console.info('====>' + actionStr + ' startAbilityByCall data:' + JSON.stringify(data));
        commonEventData.parameters!.message = data;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>' + actionStr + ' publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      }).catch((err: BusinessError) => {
        console.info('====>' + actionStr + ' startAbilityByCall err:' + JSON.stringify(err));
        commonEventData.parameters!.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>' + actionStr + ' publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    if (actionStr == 'Acts_CrossUserCall_3000') {
      let caller: ESObject;
      const releaseCallback = (data: ESObject) => {
        console.info('====>' + actionStr + ' releaseCallBack:' + data);
        commonEventData.parameters!.message = data;
        commonEvent.publish('ACTS_CROSS_RELEASE_EVENT', commonEventData, (err) => {
          console.info('====>' + actionStr + '  onRelease event publish err:' + JSON.stringify(err));
        })
      }
      this.context.startAbilityByCallWithAccount({
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
      }, accountId).then((data: ESObject) => {
        caller = data;
        caller.onRelease(releaseCallback);
        let param = new MyParcelAble(3000, 'Acts_CrossUserCall_3000', false);
        caller.callWithResult('call', param).then((data: ESObject) => {
          let result = new MyParcelAble(0, '', false);
          data.readParcelable(result);
          console.info('====>' + actionStr + ' callWithResult result:' + JSON.stringify(result));
          commonEventData.parameters!.message = result;
          commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
            console.info('====>' + actionStr + ' call event publish err:' + JSON.stringify(err));
            globalThis.terminate();
          })
          caller.release();
        })
      }).catch((err: BusinessError) => {
        console.info('====>' + actionStr + '  startAbilityByCall err:' + JSON.stringify(err));
      })
    }

    if (want.action === 'Acts_CrossUserCall_1000') {
      globalThis.Acts_CrossUserCall_1000()
    }else if (want.action === 'Acts_CrossUserCall_1200') {
      console.info('====>Acts_CrossUserCall_1200  service');
      globalThis.Acts_CrossUserCall_1200()
    }else if (want.action === 'Acts_CrossUserCall_1400') {
      globalThis.Acts_CrossUserCall_1400()
    }else if (want.action === 'Acts_CrossUserCall_1600') {
      globalThis.Acts_CrossUserCall_1600()
    }else if (want.action === 'Acts_CrossUserCall_1800') {
      globalThis.Acts_CrossUserCall_1800()
    }else if (want.action === 'Acts_CrossUserCall_2000') {
      globalThis.Acts_CrossUserCall_2000()
    }

  }
  onDestroy() {
    console.info('ServiceAbility onDestroy');
  }

  onRequest(want: Want, startId: number) {
    console.info('ServiceAbility onRequest');
  }

  onConnect(want: Want) {
    console.info('ServiceAbility onConnect');
    return remoteOBJ;
  }

  onDisconnect(want: Want) {
    console.info('ServiceAbility onDisconnect');
  }

  onReconnect(want: Want) {
    console.info('ServiceAbility onReconnect');
  }

  onConfigurationUpdate(newConfig: Configuration) {
    console.info('ServiceAbility onConfigurationUpdate');
  }

  onDump(params: ESObject) {
    console.info('ServiceAbility onDump');
    return [];
  }
};