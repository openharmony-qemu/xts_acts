/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import account_appAccount from '@ohos.account.appAccount';
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import Want from '@ohos.app.ability.Want';
import rpc from '@ohos.rpc';
import { BusinessError } from '@ohos.base';

const TAG: string = '[AccountTest]';
let authenticator: MyAuthenticator | undefined = undefined;

interface CredentialMap {
  PIN?: string;
  NUMBER?: string;
  FACE?: string;
}

let accountLabels: Record<string, string[]> = {
  'zhangsan': ['male', '30-40', 'level4'],
  'lisi': ['female']
} as Record<string, string[]>;
let accountCredentials: Record<string, CredentialMap> = {
  'zhangsan': {
    'PIN': '123456',
    'NUMBER': '12356789'
  },
  'lisi': {
    'FACE': 'X00001'
  }
} as Record<string, CredentialMap>;
let accountRemovability: Record<string, boolean> = {
  'zhangsan': false,
  'lisi': true
} as Record<string, boolean>;

class MyAuthenticator extends account_appAccount.Authenticator {
  addAccountImplicitly(authType: string, callerBundleName: string, options: Record<string, Object>,
    callback: account_appAccount.AuthenticatorCallback): void {
    console.log(TAG + 'authType: ' + authType + 'callerBundleName: ' + callerBundleName +
      ', options: ' + JSON.stringify(options));
    let appAccountMgr = account_appAccount.createAppAccountManager();
    let newAccountName: string = 'addNewAccountName';
    appAccountMgr.createAccount(newAccountName, (err: BusinessError) => {
      let authResult: account_appAccount.AuthResult = {
        name: newAccountName,
        owner: 'com.acts.accountauthenticator'
      } as ESObject;
      callback.onResult(0, authResult as ESObject);
    });
  }

  authenticate(name: string, authType: string, callerBundleName: string, options: Record<string, Object>,
    callback: account_appAccount.AuthenticatorCallback): void {
    console.log(TAG + 'name: ' + name + 'authType: ' + authType + 'callerBundleName: ' + callerBundleName +
      ', options: ' + JSON.stringify(options));
    let appAccountMgr = account_appAccount.createAppAccountManager();
    appAccountMgr.createAccount(name, (err: BusinessError) => {
      callback.onResult(0, {
        name: name,
        authType: authType,
        token: '123456'
      } as ESObject);
    });
  }

  createAccountImplicitly(options: account_appAccount.CreateAccountImplicitlyOptions,
    callback: account_appAccount.AuthCallback): void {
    console.log(TAG + 'options: ' + JSON.stringify(options));
    let appAccountMgr = account_appAccount.createAppAccountManager();
    let newAccountName: string = 'createNewAccountName';
    appAccountMgr.createAccount(newAccountName, (err: BusinessError) => {
      console.log(TAG + 'createAccount err: ' + JSON.stringify(err));
      if (err !== null && err.code === 12300004) {
        callback.onResult(12300007);
        return;
      }
      let authResult: account_appAccount.AuthResult = {
        account: {
          name: newAccountName,
          owner: 'com.acts.accountauthenticator'
        }
      };
      callback.onResult(0, authResult);
    });
  }

  auth(name: string, authType: string, options: Record<string, Object>,
    callback: account_appAccount.AuthCallback): void {
    console.log(TAG + 'name: ' + name + 'authType: ' + authType + ', options: ' + JSON.stringify(options));
    if (name === 'notExistAccount') {
      callback.onResult(12300003);
      return;
    }
    let authResult: account_appAccount.AuthResult = {
      account: {
        name: name,
        owner: 'com.acts.accountauthenticator'
      },
      tokenInfo: {
        authType: 'getSocialData',
        token: 'xxxxxxxxx',
        account: {
          name: name,
          owner: 'com.acts.accountauthenticator'
        }
      }
    };
    callback.onResult(0, authResult);
  }

  verifyCredential(name: string, options: account_appAccount.VerifyCredentialOptions,
    callback: account_appAccount.AuthCallback): void {
    console.log(TAG + 'name: ' + name + ', options: ' + JSON.stringify(options));
    if (name === 'notExistAccount') {
      callback.onResult(12300003);
      return;
    }
    if (name == 'xiaoming') {
      callback.onRequestContinued!();
      return;
    }
    let credentialInfo: CredentialMap | undefined = undefined;
    try {
      credentialInfo = accountCredentials[name];
    } catch (err) {
      console.log(TAG + ' no credential');
      callback.onResult(0, { 'booleanResult': false } as account_appAccount.AuthResult);
      return;
    }
    if (options.credentialType == undefined || options.credential == undefined) {
      callback.onRequestRedirected({
        bundleName: 'com.acts.accountauthenticator',
        abilityName: 'VerifyAbility',
        parameters: {
          credentialType: options.credentialType as Object,
          credential: options.credential as Object
        }
      });
      return;
    }
    try {
      let key: string = options.credentialType.toUpperCase();
      let credential: string | undefined = undefined;
      if (credentialInfo !== undefined) {
        if (key === 'PIN') {
          credential = credentialInfo.PIN;
        } else if (key === 'NUMBER') {
          credential = credentialInfo.NUMBER;
        } else if (key === 'FACE') {
          credential = credentialInfo.FACE;
        }
      }
      if (credential == options.credential) {
        callback.onResult(0, { 'booleanResult': true } as account_appAccount.AuthResult);
      } else {
        callback.onResult(0, { 'booleanResult': false } as account_appAccount.AuthResult);
      }
    } catch (err) {
      console.log(TAG + ' check credential error');
      callback.onResult(0, { 'booleanResult': false } as account_appAccount.AuthResult);
    }
  }

  checkAccountLabels(name: string, labels: Array<string>, callback: account_appAccount.AuthCallback): void {
    console.log(TAG + 'name: ' + name + ', labels: ' + JSON.stringify(labels) + ', callback: ' + callback);
    if (name === 'notExistAccount') {
      callback.onResult(12300003);
      return;
    }
    if (labels.length == 0) {
      callback.onResult(0, { 'booleanResult': true } as account_appAccount.AuthResult);
      return;
    }
    let allLabels: string[] | undefined = undefined;
    try {
      allLabels = accountLabels[name];
    } catch (err) {
      console.log('no labels');
      allLabels = undefined;
    }
    if (allLabels == undefined || allLabels.length == 0) {
      callback.onResult(0, { 'booleanResult': false } as account_appAccount.AuthResult);
      return;
    }
    for (let i = 0; i < labels.length; ++i) {
      if (allLabels.indexOf(labels[i]) == -1) {
        callback.onResult(0, { 'booleanResult': false } as account_appAccount.AuthResult);
        return;
      }
    }
    callback.onResult(0, { 'booleanResult': true } as account_appAccount.AuthResult);
  }

  async setProperties(options: account_appAccount.SetPropertiesOptions,
    callback: account_appAccount.AuthCallback): Promise<void> {
    console.log(TAG + 'options: ' + JSON.stringify(options));
    let props: Record<string, Object> | undefined = options.properties;
    if (props !== undefined && props.prop1 === 'remove') {
      let appAccountMgr = account_appAccount.createAppAccountManager();
      console.info('====>start remove ' + JSON.stringify(props.prop2));
      let accountName: string = String(props.prop2);
      try {
        await appAccountMgr.removeAccount(accountName);
        callback.onResult(0);
        return;
      } catch (err) {
        console.info('====>removeAccount err:' + JSON.stringify(err));
      }
    }
    callback.onResult(10016, {});
  }

  checkAccountRemovable(name: string, callback: account_appAccount.AuthCallback): void {
    console.log(TAG + 'name: ' + name);
    let isRemovable: boolean = false;
    try {
      isRemovable = accountRemovability[name];
    } catch (err) {
      console.log(TAG + 'error: ' + JSON.stringify(err));
    }
    callback.onResult(0, { 'booleanResult': isRemovable } as account_appAccount.AuthResult);
  }
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want: Want): void {
    console.info('accountauthenticator ServiceAbility onCreate');
  }

  onConnect(want: Want): rpc.RemoteObject {
    console.info('accountauthenticator ServiceAbility onConnect');
    authenticator = new MyAuthenticator();
    return authenticator.getRemoteObject();
  }

  onReconnect(want: Want): void {
    console.info('accountauthenticator ServiceAbility onReconnect');
  }

  onDisconnect(want: Want): void {
    console.info('accountauthenticator ServiceAbility onDisconnect');
  }

  onRequest(want: Want, startId: number): void {
    console.info('accountauthenticator ServiceAbility onRequest');
  }

  onDestroy(): void {
    console.info('accountauthenticator ServiceAbility onCronDestroyeate');
  }
}
