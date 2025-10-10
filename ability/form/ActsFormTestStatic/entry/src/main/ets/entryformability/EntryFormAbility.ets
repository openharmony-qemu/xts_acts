/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import formBindingData from '@ohos.app.form.formBindingData';
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import formInfo from '@ohos.app.form.formInfo';
import Want from '@ohos.app.ability.Want';
import { Configuration } from '@ohos.app.ability.Configuration';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError, RecordData } from '@ohos.base';
import FormExtensionContext from 'application.FormExtensionContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { ElementName } from 'bundleManager.ElementName'
import rpc from '@ohos.rpc';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag EntryFormAbility';

function onAcquireFormStateCallback(want: Want): formInfo.FormState {
  try {
    let options: CommonEventManager.CommonEventPublishData = {
      code: 0,			 // Result code of the common event.
      data: 'onAcquireFormState is called',// Result data of the common event.
      isOrdered: true	 // The common event is an ordered one.
    }
    hilog.info(DOMAIN, TAG, 'OnAcquireFormState callback success');
    CommonEventManager.publish('XTS_FormExtensionAbilityOnAcquireFormStateTest_commonEvent', options, () => {
      hilog.info(DOMAIN, TAG, 'OnAcquireFormStateTest001 commonEvent publish');
    })
    hilog.info(DOMAIN, TAG, 'OnAcquireFormState register success');;
    return formInfo.FormState.READY;
  } catch (error) {
    hilog.error(DOMAIN, TAG, `OnAcquireFormState catch error: ${error}`);
    return formInfo.FormState.UNKNOWN;
  }
}

function onShareFormCallback(formId: string): Record<string, Object> {
  console.log(`FormExtensionAbility onAcquireFormData, formId: ${formId}`);
  let wantParams: Record<string, Object> = {
    'temperature': '20',
    'time': '2022-8-8 09:59',
  };
  try {
    let options: CommonEventManager.CommonEventPublishData = {
      code: 0,			 // Result code of the common event.
      data: 'OnShareForm is called',// Result data of the common event.
      isOrdered: true	 // The common event is an ordered one.
    }
    hilog.info(DOMAIN, TAG, 'OnShareForm callback success');
    CommonEventManager.publish('XTS_FormExtensionAbilityOnShareFormTest_commonEvent', options, () => {
      hilog.info(DOMAIN, TAG, 'OnShareFormTest001 commonEvent publish');
    })
    hilog.info(DOMAIN, TAG, 'OnShareForm register success');;
    return wantParams;
  } catch (error) {
    hilog.error(DOMAIN, TAG, `OnShareForm catch error: ${error}`);
    return wantParams;
  }
}

function onAcquireFormDataCallback(formId: string): Record<string, Object> {
  console.log(`FormExtensionAbility onAcquireFormData, formId: ${formId}`);
  let wantParams: Record<string, Object> = {
    'temperature': '20',
    'time': '2022-8-8 09:59',
  };
  try {
    let options: CommonEventManager.CommonEventPublishData = {
      code: 0,			 // Result code of the common event.
      data: 'OnAcquireFormData is called',// Result data of the common event.
      isOrdered: true	 // The common event is an ordered one.
    }
    hilog.info(DOMAIN, TAG, 'OnAcquireFormData callback success');
    CommonEventManager.publish('XTS_FormExtensionAbilityOnAcquireFormDataTest_commonEvent', options, () => {
      hilog.info(DOMAIN, TAG, 'OnAcquireFormDataTest001 commonEvent publish');
    })
    hilog.info(DOMAIN, TAG, 'OnAcquireFormData register success');;
    return wantParams;
  } catch (error) {
    hilog.error(DOMAIN, TAG, `OnAcquireFormData catch error: ${error}`);
    return wantParams;
  }
}

export default class EntryFormAbility extends FormExtensionAbility {

  connectId: long = -1;
  constructor() {
    hilog.error(DOMAIN, TAG, 'constructor register');

    try {
      this.onStop = () => {
        hilog.info(DOMAIN, TAG, 'OnStop callback success');
        CommonEventManager.publish('XTS_FormExtensionAbilityOnStopTest_commonEvent', () => {
          hilog.info(DOMAIN, TAG, 'OnStopTest001 commonEvent publish');
        })
      }
      hilog.info(DOMAIN, TAG, 'OnStop register success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'OnStop catch error');
    }

    this.onAcquireFormState = onAcquireFormStateCallback;

    this.onShareForm = onShareFormCallback;

    this.onAcquireFormData = onAcquireFormDataCallback;

  }

  testConnectAppServiceExtensionSelf() {
    hilog.info(0x0000, 'testTag', `testConnectServiceExtension start`);

    let want: Want = {
      bundleName: 'com.example.actsabilityapplicationtest.static',
      abilityName: 'ServiceExt'
    };
    try {
      this.connectId = this.context.connectServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName,
          remote: rpc.IRemoteObject) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onConnect');
        },
        onDisconnect: (elementName: ElementName) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onDisconnect');
        },
        onFailed: (code: int) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onFailed, code is '+ code);
        }
      });
      hilog.info(0x0000, 'testTag', `connectServiceExtensionAbility  connectId is ${this.connectId}`);
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','connectServiceExtensionAbility Failed, code is '+ err.code);
    }
  }

  testConnectAppServiceExtensionemptywant() {
    hilog.info(0x0000, 'testTag', `testConnectAppServiceExtensionemptywant start`);

    let want: Want = {};
    try {
      this.connectId = this.context.connectServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName,
          remote: rpc.IRemoteObject) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onConnect');
        },
        onDisconnect: (elementName: ElementName) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onDisconnect');
        },
        onFailed: (code: int) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onFailed empty want, code is '+ code);
        }
      });
      hilog.info(0x0000, 'testTag', `testConnectAppServiceExtensionemptywant  connectId is ${this.connectId}`);
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','testConnectAppServiceExtensionemptywant Failed, code is '+ err.code);
    }
  }

  testConnectAppServiceExtensionerrcode16000001() {
    hilog.info(0x0000, 'testTag', `testConnectAppServiceExtensionemptywant start`);

    let want: Want = {
      bundleName: 'com.example.actsabilityapplicationtest.static',
      abilityName: 'ServiceExt1'
    };
    try {
      this.connectId = this.context.connectServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName,
          remote: rpc.IRemoteObject) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onConnect');
        },
        onDisconnect: (elementName: ElementName) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onDisconnect');
        },
        onFailed: (code: int) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onFailed 16000001, code is '+ code);
        }
      });
      hilog.info(0x0000, 'testTag', `testConnectAppServiceExtensionemptywant  connectId is ${this.connectId}`);
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','testConnectAppServiceExtensionemptywant Failed, code is '+ err.code);
    }
  }

  testConnectAppServiceExtensionerrcode16000002() {
    hilog.info(0x0000, 'testTag', `testConnectAppServiceExtensionerrcode16000002 start`);

    let want: Want = {
      bundleName: 'com.example.actsabilityapplicationtest.static',
      abilityName: 'EntryAbility'
    };
    try {
      this.connectId = this.context.connectServiceExtensionAbility(want, {
        onConnect: (elementName: ElementName,
          remote: rpc.IRemoteObject) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onConnect');
        },
        onDisconnect: (elementName: ElementName) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onDisconnect');
        },
        onFailed: (code: int) => {
          hilog.info(0x0000, 'testTagConnectOptions','ConnectOptions onFailed 16000002, code is '+ code);
        }
      });
      hilog.info(0x0000, 'testTag', `testConnectAppServiceExtensionerrcode16000002 connectId is ${this.connectId}`);
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','testConnectAppServiceExtensionerrcode16000002 Failed, code is '+ err.code);
    }
  }

  testDisConnectAppServiceExtension(){
    hilog.info(0x0000, 'testTag', `testDisConnectServiceExtension start`);
    hilog.info(0x0000, 'testTag', `disconnectServiceExtensionAbility  connectId is ${this.connectId}`);
    try {
      this.context.disconnectServiceExtensionAbility(this.connectId)
        .then(():void => {
          hilog.info(0x0000, 'testTag', `disconnectServiceExtensionAbility success.`);
        })
        .catch((err: BusinessError): void => {
          hilog.info(0x0000, 'testTag', `disconnectServiceExtensionAbility failed, code is ${err?.code}, message is ${err?.message}`);
        });
      hilog.info(0x0000, 'testTag', `testDisConnectServiceExtension end`);
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','disconnectServiceExtensionAbility Failed, code is '+ err.code);
    }
  }

  testDisConnectAppServiceExtensionpromise16000050(){
    hilog.info(0x0000, 'testTag', `DisConnectAppServiceExtensionpromise16000050 start`);
    hilog.info(0x0000, 'testTag', `DisConnectAppServiceExtensionpromise16000050 connectId is ${this.connectId}`);
    try {
      this.context.disconnectServiceExtensionAbility(-1)
        .then(():void => {
          hilog.info(0x0000, 'testTag', `disconnectServiceExtensionAbility success.`);
        })
        .catch((err: BusinessError): void => {
          hilog.info(0x0000, 'testTag', `disconnectServiceExtensionAbility failed, code is ${err?.code}, message is ${err?.message}`);
        });
      hilog.info(0x0000, 'testTag', `DisConnectAppServiceExtensionpromise16000050 end`);
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','DisConnectAppServiceExtensionpromise16000050 Failed, code is '+ err.code);
    }
  }

  testDisConnectAppServiceExtensioncallback16000050(){
    hilog.info(0x0000, 'testTag', `DisConnectAppServiceExtensioncallback16000050 start`);
    hilog.info(0x0000, 'testTag', `DisConnectAppServiceExtensioncallback16000050  connectId is ${this.connectId}`);
    try {
      this.context.disconnectServiceExtensionAbility(-1, (err: BusinessError<void> | null) => {
        hilog.info(0x0000, 'testTag', `disconnectServiceExtensionAbility failed, code is ${err?.code}, message is ${err?.message}`);
      });
      hilog.info(0x0000, 'testTag', `DisConnectAppServiceExtensioncallback16000050 end`);
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','DisConnectAppServiceExtensioncallback16000050 Failed, code is '+ err.code);
    }
  }

  teststartAbilitysuccess(){
    let want: Want = {
      bundleName: 'com.example.actsabilityapplicationtest.static',
      abilityName: 'EntryAbility1'
    };
    try {
      this.context.startAbility(want, (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', `startAbility begin`);
        if(err) {
          if (err.code) {
            hilog.info(0x0000, 'testTag', `startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          hilog.info(0x0000, 'testTag', `startAbility success`);
        }
      });
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, 'testTag','startAbility Failed, code is '+ err.code);
    }

  }

  teststartAbilityinvalidparameters(){
    let want: Want = {};
    this.context.startAbility(want, (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag', `startAbilityinvalidparameters begin`);
      if(err) {
        if (err.code) {
          hilog.info(0x0000, 'testTag', `startAbilityinvalidparameters failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, 'testTag', `startAbilityinvalidparameters success`);
      }
    });
  }

  onAddForm(want: Want) : formBindingData.FormBindingData {
    hilog.info(DOMAIN, TAG, 'onAddForm testing');
    AppStorage.setOrCreate<FormExtensionContext>("FormExtensionContext", this.context);
    const formData = '';
    return formBindingData.createFormBindingData(formData);

    hilog.info(0x0000, 'testTag', 'formExtensionContext.startAbility success start');
    this.teststartAbilitysuccess();
    hilog.info(0x0000, 'testTag', 'formExtensionContext.startAbility success end');

    hilog.info(0x0000, 'testTag', 'formExtensionContext.startAbility invalid parameters start');
    this.teststartAbilityinvalidparameters();
    hilog.info(0x0000, 'testTag', 'formExtensionContext.startAbility invalid parameters end');

    hilog.info(0x0000, 'testTag', 'formExtensionContext.ConnectAppServiceExtension errcode 16000001 start');
    this.testConnectAppServiceExtensionerrcode16000001();
    hilog.info(0x0000, 'testTag', 'formExtensionContext.ConnectAppServiceExtension errcode 16000001 end');

    hilog.info(0x0000, 'testTag', 'formExtensionContext.ConnectAppServiceExtension errcode 16000002 start');
    this.testConnectAppServiceExtensionerrcode16000002();
    hilog.info(0x0000, 'testTag', 'formExtensionContext.ConnectAppServiceExtension errcode 16000002 end');

    hilog.info(0x0000, 'testTag', 'formExtensionContext.DisConnectAppServiceExtension promise 16000050 start');
    this.testDisConnectAppServiceExtensionpromise16000050();
    hilog.info(0x0000, 'testTag', 'formExtensionContext.DisConnectAppServiceExtension promise 16000050 end');

    hilog.info(0x0000, 'testTag', 'formExtensionContext.DisConnectAppServiceExtension callback 16000050 start');
    this.testDisConnectAppServiceExtensioncallback16000050();
    hilog.info(0x0000, 'testTag', 'formExtensionContext.DisConnectAppServiceExtension callback 16000050 end');

    hilog.info(0x0000, 'testTag', 'formExtensionContext.ConnectAppServiceExtension success start');
    this.testConnectAppServiceExtensionSelf();
    setTimeout(() => {
      hilog.info(0x0000, 'testTag', 'formExtensionContext.DisConnectAppServiceExtension success start');
      this.testDisConnectAppServiceExtension();
      hilog.info(0x0000, 'testTag', 'formExtensionContext.DisConnectAppServiceExtension success end');
    }, 1000)
    hilog.info(0x0000, 'testTag', 'formExtensionContext.ConnectAppServiceExtension success end');
  }

  onCastToNormalForm(formId: string) {
    hilog.info(DOMAIN, TAG, 'onCastToNormalForm testing');
  }

  onFormEvent(formId: string, message: string) {
    hilog.info(DOMAIN, TAG, 'onFormEvent testing');
  }

  onRemoveForm(formId: string) {
    hilog.info(DOMAIN, TAG, 'onRemoveForm testing');
  }

  onConfigurationUpdate(newConfig: Configuration) {
    hilog.info(DOMAIN, TAG, 'onConfigurationUpdate testing');
    CommonEventManager.publish('XTS_FormExtensionAbilityOnConfigurationUpdate_commonEvent', () => {
      hilog.info(DOMAIN, TAG, 'OnConfigurationUpdateStaticTest001 commonEvent publish');
    });
  }

  onFormLocationChanged(formId: string, newFormLocation: formInfo.FormLocation) {
    hilog.info(DOMAIN, TAG, 'onFormLocationChanged testing');
    CommonEventManager.publish('XTS_FormExtensionAbilityonFormLocationChanged_commonEvent', () => {
      hilog.info(DOMAIN, TAG, 'onFormLocationChangedStaticTest001 commonEvent publish');
    });
  }

}
