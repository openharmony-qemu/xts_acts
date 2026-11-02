  static delay(milliseconds: number): Promise<void> {
    return new Promise<void>((resolve) => setTimeout(resolve, milliseconds));
  }

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
import { inputMethodEngine } from '@kit.IMEKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import hilog from '@ohos.hilog';
import process from '@ohos.process';

export interface SubmitObservation {
  action: EnterKeyType;
  text: string;
}

export interface HideObservation {
  receivedNotifications: number;
  adapterNotifications: number;
}

export class EditorFixture {
  static uiReady: boolean = false;
  static focus: () => void = () => { throw new Error('Editor not ready'); };
  static blur: () => void = () => { throw new Error('Editor not ready'); };
  static focusNumber: () => void = () => { throw new Error('Number editor not ready'); };
  static readCaret: () => CaretOffset = () => { throw new Error('Editor caret not ready'); };
  static isWindowFocused: () => boolean = () => false;
  static windowActive: boolean = false;
  static select: (start: number, end: number) => void = () => {
    throw new Error('Editor not ready');
  };
  static text: string = '';
  static cursor: number = 0;
  static client: inputMethodEngine.ProxyTextInputClient | null = null;
  static controller: inputMethodEngine.ProxyKeyboardController | null = null;
  static editorFocused: boolean = false;
  static editorFocusEvents: number = 0;
  static editorBlurEvents: number = 0;
  static sinkFocusEvents: number = 0;
  static submissions: SubmitObservation[] = [];
  private static hideSequence: number = 0;

  static onSubmit(action: EnterKeyType, event: SubmitEvent): void {
    EditorFixture.submissions.push({ action: action, text: event.text });
    event.keepEditableState();
  }

  static onEditorFocus(): void {
    EditorFixture.editorFocused = true;
    EditorFixture.editorFocusEvents++;
  }

  static onEditorBlur(): void {
    EditorFixture.editorFocused = false;
    EditorFixture.editorBlurEvents++;
  }

  static onSinkFocus(): void {
    EditorFixture.sinkFocusEvents++;
  }

  static delay(milliseconds: number): Promise<void> {
    return new Promise<void>((resolve) => setTimeout(resolve, milliseconds));
  }

  static async waitUntil(check: () => boolean): Promise<void> {
    for (let attempt = 0; attempt < 100; attempt++) {
      if (check()) {
        return;
      }
      await new Promise<void>((resolve) => setTimeout(resolve, 50));
    }
    throw new Error('Timed out waiting for editor event');
  }

  static async bind(text: string = 'abcdef', cursor: number = 3, multiline: boolean = false): Promise<void> {
    await EditorFixture.bindEditor(text, cursor, multiline, true);
  }

  static async bindRegistered(text: string = 'abcdef', cursor: number = 3,
    multiline: boolean = false): Promise<void> {
    // Observe the registration under test without replacing it with a new one.
    await EditorFixture.bindEditor(text, cursor, multiline, false);
  }

  private static async bindEditor(text: string, cursor: number, multiline: boolean,
    register: boolean): Promise<void> {
    try {
      await EditorFixture.waitUntil(() => EditorFixture.uiReady);
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability is unavailable');
      }
      EditorFixture.client = null;
      EditorFixture.controller = null;
      EditorFixture.submissions = [];
      ability.onInputStart((client, controller) => {
        EditorFixture.client = client;
        EditorFixture.controller = controller;
      });
      ability.onKeyboardShow(() => { AppStorage.setOrCreate('proxyKeyboardVisible', true); });
      ability.onKeyboardHide(() => { AppStorage.setOrCreate('proxyKeyboardVisible', false); });
      AppStorage.setOrCreate('proxyMultiline', multiline);
      AppStorage.setOrCreate('proxyText', text);
      if (register) {
        await inputMethodEngine.registerInAppProxyIme();
      }
      await EditorFixture.waitUntil(() => {
        if (EditorFixture.client === null) {
          try {
            EditorFixture.focus();
          } catch (error) {
            if (!(error as Error).message.includes("The component doesn't exist")) {
              throw error as Error;
            }
          }
        }
        return EditorFixture.client !== null;
      });
      EditorFixture.select(cursor, cursor);
      // The following read observes the real editor after the declarative update.
      for (let attempt = 0; attempt < 100; attempt++) {
        const client = EditorFixture.getClient();
        if (await client.getForward(text.length) === text.substring(0, cursor) &&
          await client.getBackward(text.length) === text.substring(cursor)) {
          EditorFixture.text = text;
          return;
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 50));
      }
      throw new Error('Editor text/cursor setup did not settle');
    } catch (error) {
      const failure = error as Error;
      throw new Error('Editor fixture bind failed: ' + failure.message);
    }
  }

  static getClient(): inputMethodEngine.ProxyTextInputClient {
    if (EditorFixture.client === null) {
      throw new Error('No bound proxy client');
    }
    return EditorFixture.client;
  }

  static async hideAndObserve(controller: inputMethodEngine.ProxyKeyboardController): Promise<HideObservation> {
    try {
      const token = Date.now() + '-' + (++EditorFixture.hideSequence);
      const begin = '====> BEGIN hideSelf token=' + token;
      hilog.info(0x0044, 'XtsProxyHide', '%{public}s', begin);
      await controller.hideSelf();
      for (let attempt = 0; attempt < 100; attempt++) {
        const output = await abilityDelegatorRegistry.getAbilityDelegator()
          .executeShellCommand('hilog -x -P ' + process.pid + ' -T XtsProxyHide,AceTextField');
        if (output.exitCode !== 0) {
          throw new Error('Cannot read real editor hide notification: ' + output.stdResult);
        }
        const lines = output.stdResult.split('\n');
        let start = -1;
        for (let index = 0; index < lines.length; index++) {
          if (lines[index].includes('/XtsProxyHide:') && lines[index].includes(begin)) {
            start = index;
          }
        }
        if (start >= 0) {
          const actualTag = /^\d{2}-\d{2}\s+\S+\s+\d+\s+\d+\s+[A-Z]\s+\S*\/AceTextField:/;
          const received = lines.slice(start + 1).filter((line: string) => actualTag.test(line));
          const notifications = received.filter((line: string) => /SendKeyboardStatus status: 1\b/.test(line));
          const adapted = received.filter((line: string) => /SetKeyboardStatus status: 0\b/.test(line));
          if (notifications.length > 0 && adapted.length > 0) {
            // Check editor liveness; the logs prove receipt, not completion of queued UI work.
            await EditorFixture.getClient().getTextIndexAtCursor();
            // These are ArkUI receiver logs from this process, not locally simulated callbacks.
            console.info('====> hideSelf receiver token=' + token + ' pid=' + process.pid +
              ' received=' + notifications.length + ' adapted=' + adapted.length);
            hilog.info(0x0044, 'XtsProxyHide', '%{public}s', '====> END hideSelf token=' + token);
            return { receivedNotifications: notifications.length, adapterNotifications: adapted.length };
          }
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 50));
      }
      throw new Error('Missing real ArkUI hide receiver evidence: token=' + token + ' pid=' + process.pid);
    } catch (error) {
      throw error as Error;
    }
  }

  static async cleanup(): Promise<void> {
    await EditorFixture.waitUntil(() => EditorFixture.uiReady);
    let failureMessage = '';
    try {
      EditorFixture.blur();
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      ability?.offInputStart();
      ability?.offKeyboardShow();
      ability?.offKeyboardHide();
      ability?.offUnregister();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      delegate?.offKeyEvent();
      delegate?.offCursorContextChange();
      delegate?.offSelectionChange();
      delegate?.offTextChange();
      delegate?.offEditorAttributeChanged();
    } catch (error) {
      failureMessage = 'listeners: ' + (error as Error).message;
    }
    try {
      await inputMethodEngine.unregisterInAppProxyIme();
    } catch (error) {
      failureMessage += '; unregister: ' + (error as Error).message;
    } finally {
      AppStorage.setOrCreate('proxyText', '');
      AppStorage.setOrCreate('proxyKeyboardVisible', false);
      AppStorage.setOrCreate('proxyMultiline', false);
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Done);
      EditorFixture.cursor = 0;
      EditorFixture.text = '';
      EditorFixture.client = null;
      EditorFixture.controller = null;
      EditorFixture.submissions = [];
    }
    if (failureMessage.length > 0) {
      throw new Error('Editor fixture cleanup failed: ' + failureMessage);
    }
  }
}
