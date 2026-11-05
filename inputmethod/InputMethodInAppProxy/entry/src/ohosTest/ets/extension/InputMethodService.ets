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
import { InputMethodExtensionAbility, inputMethodEngine } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import process from '@ohos.process';

export default class InputMethodService extends InputMethodExtensionAbility {
  onCreate(): void {
    this.probe();
  }

  private record(operation: string, code: number, message: string): void {
    hilog.info(0x0001, 'XtsProxyExt', '%{public}s', '====> ' + JSON.stringify({
      operation: operation, code: code, message: message, pid: process.pid, stamp: Date.now()
    }));
  }

  private getter(operation: string, invoke: () => void): void {
    try {
      invoke();
      this.record(operation, 0, '');
    } catch (error) {
      const failure = error as BusinessError;
      this.record(operation, failure.code, failure.message);
    }
  }

  private async probe(): Promise<void> {
    this.getter('ability', () => { inputMethodEngine.getProxyInputMethodAbility(); });
    this.getter('delegate', () => { inputMethodEngine.getProxyKeyboardDelegate(); });
    try {
      await inputMethodEngine.registerInAppProxyIme();
      this.record('register', 0, '');
    } catch (error) {
      const failure = error as BusinessError;
      this.record('register', failure.code, failure.message);
    }
    try {
      await inputMethodEngine.unregisterInAppProxyIme();
      this.record('unregister', 0, '');
    } catch (error) {
      const failure = error as BusinessError;
      this.record('unregister', failure.code, failure.message);
    }
  }
}
