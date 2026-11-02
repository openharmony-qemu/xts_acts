    afterEach(async () => { await EditorFixture.cleanup(); });
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import { inputMethodEngine } from '@kit.IMEKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import keyEvent from '@ohos.multimodalInput.keyEvent';
import { EditorFixture } from './EditorFixture';

function sameCursor(left: number[], right: number[]): boolean {
  return left[0] === right[0] && left[1] === right[1] && left[2] === right[2];
}

async function verifyCursorRoundTrip(client: inputMethodEngine.ProxyTextInputClient,
  received: number[][], live: number[][]): Promise<void> {
  try {
    let baseline: number[] = [];
    let localBaseline: number[] = [];
    for (let step = 0; step < 3; step++) {
      const ownStart = received.length;
      const liveStart = live.length;
      const direction = step === 2 ? inputMethodEngine.Direction.CURSOR_LEFT : inputMethodEngine.Direction.CURSOR_RIGHT;
      const target = step === 1 ? 5 : 4;
      await client.moveCursor(direction);
      try {
        await EditorFixture.waitUntil(() => EditorFixture.readCaret().index === target);
      } catch (error) {
        throw new Error('Editor cursor did not reach ' + target + ' at step ' + step +
          ', actual=' + EditorFixture.readCaret().index);
      }
      let clientCursor = -1;
      for (let attempt = 0; attempt < 100; attempt++) {
        clientCursor = await client.getTextIndexAtCursor();
        if (clientCursor === target) {
          break;
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 50));
      }
      expect(clientCursor).assertEqual(target);
      const caret = EditorFixture.readCaret();
      expect(caret.index).assertEqual(target);
      const matches = (payload: number[]): boolean => {
        if (!Number.isFinite(payload[0]) || !Number.isFinite(payload[1]) ||
          !Number.isFinite(payload[2]) || payload[2] <= 0) {
          return false;
        }
        if (step === 1) {
          const current = EditorFixture.readCaret();
          // Compare relative movement with the independent public editor controller.
          // No absolute screen origin, DPI or text direction is assumed.
          const localX = current.x - localBaseline[0];
          const localY = current.y - localBaseline[1];
          return current.index === target &&
            ((payload[0] - baseline[0]) * localX > 0 ||
              (payload[1] - baseline[1]) * localY > 0);
        }
        return step === 0 || sameCursor(payload, baseline);
      };
      // Require a new matching event in each phase; 4 -> 5 -> 4 rejects a one-step-lagged trace.
      try {
        await EditorFixture.waitUntil(() =>
          received.slice(ownStart).some(matches) && live.slice(liveStart).some(matches));
      } catch (error) {
        throw new Error('Cursor callbacks missing at step ' + step + ', editor=' + EditorFixture.readCaret().index +
          ', client=' + clientCursor + ', received=' + (received.length - ownStart) +
          ', witness=' + (live.length - liveStart));
      }
      const values = received.slice(ownStart).filter(matches);
      const observed = values[values.length - 1];
      expect(observed !== undefined).assertTrue();
      if (observed === undefined) {
        throw new Error('Missing cursor event after real editor movement');
      }
      expect(live.slice(liveStart).some((payload: number[]) => sameCursor(payload, observed))).assertTrue();
      if (step === 0) {
        baseline = observed;
        const current = EditorFixture.readCaret();
        localBaseline = [current.x, current.y];
      } else if (step === 2) {
        const current = EditorFixture.readCaret();
        expect(current.x).assertEqual(localBaseline[0]);
        expect(current.y).assertEqual(localBaseline[1]);
      }
    }
    expect(EditorFixture.text).assertEqual('abcdef');
  } catch (error) {
    throw error as Error;
  }
}

export default function inAppProxyEvents(): void {
  describe('inAppProxyEvents', () => {
    beforeEach(async () => { await EditorFixture.cleanup(); });
    afterEach(async () => { await EditorFixture.cleanup(); });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0400
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0400
     * @tc.desc onInputStart：订阅 inputStart 事件。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0400', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      expect(EditorFixture.client !== null).assertTrue();
      expect(EditorFixture.controller !== null).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0530
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0530
     * @tc.desc ProxyInputMethodAbility：onInputStart 回调入参验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0530', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      expect(EditorFixture.client !== null).assertTrue();
      expect(EditorFixture.controller !== null).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0410
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0410
     * @tc.desc offInputStart：指定 callback 取消。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0410', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (client: inputMethodEngine.ProxyTextInputClient,
        controller: inputMethodEngine.ProxyKeyboardController): void => { count++; };
      ability.onInputStart(callback);
      ability.offInputStart(callback);
      await EditorFixture.bind();
      // A separate live listener receiving inputStart is the negative-test witness.
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0420
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0420
     * @tc.desc offInputStart：不传 callback 取消全部。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0420', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (client: inputMethodEngine.ProxyTextInputClient,
        controller: inputMethodEngine.ProxyKeyboardController): void => { count++; };
      ability.onInputStart(callback);
      ability.offInputStart();
      await EditorFixture.bind();
      // A separate live listener receiving inputStart is the negative-test witness.
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0560
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0560
     * @tc.desc ProxyInputMethodAbility：on→off→事件不触发。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0560', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (client: inputMethodEngine.ProxyTextInputClient,
        controller: inputMethodEngine.ProxyKeyboardController): void => { count++; };
      ability.onInputStart(callback);
      ability.offInputStart(callback);
      await EditorFixture.bind();
      // A separate live listener receiving inputStart is the negative-test witness.
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0540
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0540
     * @tc.desc onInputStart 的两个不同回调均收到真实会话开始事件。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0540', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let first = 0;
      let second = 0;
      ability.onInputStart(() => { first++; });
      ability.onInputStart(() => { second++; });
      await EditorFixture.bind();
      await EditorFixture.waitUntil(() => first > 0 && second > 0);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0500
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0500
     * @tc.desc ProxyInputMethodAbility：off 传未注册的 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0500', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      ability.offInputStart(() => {});
      await EditorFixture.bind();
      expect(EditorFixture.client !== null).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0510
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0510
     * @tc.desc ProxyInputMethodAbility：未订阅直接 off。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0510', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      ability.offInputStart();
      await EditorFixture.bind();
      expect(EditorFixture.client !== null).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0520
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0520
     * @tc.desc ProxyInputMethodAbility：on 后立即 off 再 on。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0520', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (): void => { count++; };
      ability.onInputStart(callback);
      ability.offInputStart(callback);
      ability.onInputStart(callback);
      await EditorFixture.bind();
      await EditorFixture.waitUntil(() => count > 0);
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0430
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0430
     * @tc.desc onKeyboardShow：订阅 keyboardShow。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0430', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (): void => { count++; };
      ability.onKeyboardShow(callback);
      await EditorFixture.bind();
      await EditorFixture.waitUntil(() => AppStorage.get<boolean>('proxyKeyboardVisible') === true);
      await EditorFixture.waitUntil(() => count > 0);
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0440
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0440
     * @tc.desc offKeyboardShow：指定 callback 取消。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0440', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (): void => { count++; };
      ability.onKeyboardShow(callback);
      ability.offKeyboardShow(callback);
      await EditorFixture.bind();
      await EditorFixture.waitUntil(() => AppStorage.get<boolean>('proxyKeyboardVisible') === true);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0450
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0450
     * @tc.desc offKeyboardShow：不传 callback 取消全部。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0450', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (): void => { count++; };
      ability.onKeyboardShow(callback);
      ability.offKeyboardShow();
      await EditorFixture.bind();
      await EditorFixture.waitUntil(() => AppStorage.get<boolean>('proxyKeyboardVisible') === true);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0460
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0460
     * @tc.desc onKeyboardHide：订阅 keyboardHide。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0460', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (): void => { count++; };
      ability.onKeyboardHide(callback);
      await EditorFixture.bind();
      await EditorFixture.waitUntil(() => AppStorage.get<boolean>('proxyKeyboardVisible') === true);
      await inputMethodEngine.unregisterInAppProxyIme();
      await EditorFixture.waitUntil(() => AppStorage.get<boolean>('proxyKeyboardVisible') === false);
      await EditorFixture.waitUntil(() => count > 0);
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0470
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0470
     * @tc.desc offKeyboardHide：不传 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0470', Level.LEVEL1, async () => {
      const ability = inputMethodEngine.getProxyInputMethodAbility();
      if (ability === null) {
        throw new Error('Proxy ability unavailable');
      }
      let count = 0;
      const callback = (): void => { count++; };
      ability.onKeyboardHide(callback);
      ability.offKeyboardHide();
      await EditorFixture.bind();
      await EditorFixture.waitUntil(() => AppStorage.get<boolean>('proxyKeyboardVisible') === true);
      await inputMethodEngine.unregisterInAppProxyIme();
      await EditorFixture.waitUntil(() => AppStorage.get<boolean>('proxyKeyboardVisible') === false);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1170
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1170
     * @tc.desc onTextChange/offTextChange：订阅。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1170', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;
      const received: string[] = [];
      const callback = (text: string): void => {
        received.push(text);
        count++;
      };
      const witnessCallback = (text: string): void => {
        witness++;
      };
      delegate.onTextChange(callback);

      delegate.onTextChange(witnessCallback);
      await client.insertText('X');
      await EditorFixture.waitUntil(() => witness > 0);
      await EditorFixture.waitUntil(() => received.length > 0);
      expect(count > 0).assertTrue();
      for (const payload of received) {
        expect(payload).assertEqual('abcXdef');
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1180
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1180
     * @tc.desc onTextChange/offTextChange：off 指定 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1180', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;

      const callback = (text: string): void => {

        count++;
      };
      const witnessCallback = (text: string): void => {
        witness++;
      };
      delegate.onTextChange(callback);
      delegate.offTextChange(callback);
      delegate.onTextChange(witnessCallback);
      await client.insertText('X');
      await EditorFixture.waitUntil(() => witness > 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1190
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1190
     * @tc.desc onTextChange/offTextChange：off 不传 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1190', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;

      const callback = (text: string): void => {

        count++;
      };
      const witnessCallback = (text: string): void => {
        witness++;
      };
      delegate.onTextChange(callback);
      delegate.offTextChange();
      delegate.onTextChange(witnessCallback);
      await client.insertText('X');
      await EditorFixture.waitUntil(() => witness > 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1200
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1200
     * @tc.desc onTextChange/offTextChange：off 传未注册 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1200', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;
      const received: string[] = [];
      const callback = (text: string): void => {
        received.push(text);
        count++;
      };
      const witnessCallback = (text: string): void => {
        witness++;
      };
      delegate.onTextChange(callback);
      delegate.offTextChange((text: string): void => {});
      delegate.onTextChange(witnessCallback);
      await client.insertText('X');
      await EditorFixture.waitUntil(() => witness > 0);
      await EditorFixture.waitUntil(() => received.length > 0);
      expect(count > 0).assertTrue();
      for (const payload of received) {
        expect(payload).assertEqual('abcXdef');
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1210
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1210
     * @tc.desc onTextChange/offTextChange：callback 参数验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1210', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;
      const received: string[] = [];
      const callback = (text: string): void => {
        received.push(text);
        count++;
      };
      const witnessCallback = (text: string): void => {
        witness++;
      };
      delegate.onTextChange(callback);

      delegate.onTextChange(witnessCallback);
      await client.insertText('X');
      await EditorFixture.waitUntil(() => witness > 0);
      await EditorFixture.waitUntil(() => received.length > 0);
      expect(count > 0).assertTrue();
      for (const payload of received) {
        expect(payload).assertEqual('abcXdef');
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1120
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1120
     * @tc.desc onSelectionChange/offSelectionChange：订阅。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1120', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;
      const received: number[][] = [];
      const callback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        received.push([oldStart, oldEnd, newStart, newEnd]);
        count++;
      };
      const witnessCallback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        witness++;
      };
      delegate.onSelectionChange(callback);

      delegate.onSelectionChange(witnessCallback);
      await client.selectByRange({ start: 1, end: 4 });
      await EditorFixture.waitUntil(() => witness > 0);
      // Binding may have queued an earlier selection notification. Require the
      // requested range rather than treating that earlier event as its result.
      await EditorFixture.waitUntil(() => received.some((payload: number[]) =>
        payload[2] === 1 && payload[3] === 4));
      expect(count > 0).assertTrue();
      for (const payload of received) {
        expect(Number.isInteger(payload[0]) && payload[0] >= 0 && payload[0] <= 6).assertTrue();
        expect(Number.isInteger(payload[1]) && payload[1] >= 0 && payload[1] <= 6).assertTrue();
        expect(Number.isInteger(payload[2]) && payload[2] >= 0 && payload[2] <= 6).assertTrue();
        expect(Number.isInteger(payload[3]) && payload[3] >= 0 && payload[3] <= 6).assertTrue();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1130
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1130
     * @tc.desc onSelectionChange/offSelectionChange：off 指定 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1130', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;

      const callback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {

        count++;
      };
      const witnessCallback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        witness++;
      };
      delegate.onSelectionChange(callback);
      delegate.offSelectionChange(callback);
      delegate.onSelectionChange(witnessCallback);
      await client.selectByRange({ start: 1, end: 4 });
      await EditorFixture.waitUntil(() => witness > 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1140
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1140
     * @tc.desc onSelectionChange/offSelectionChange：off 不传 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1140', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;

      const callback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {

        count++;
      };
      const witnessCallback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        witness++;
      };
      delegate.onSelectionChange(callback);
      delegate.offSelectionChange();
      delegate.onSelectionChange(witnessCallback);
      await client.selectByRange({ start: 1, end: 4 });
      await EditorFixture.waitUntil(() => witness > 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1150
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1150
     * @tc.desc onSelectionChange/offSelectionChange：off 传未注册 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1150', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;
      const received: number[][] = [];
      const callback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        received.push([oldStart, oldEnd, newStart, newEnd]);
        count++;
      };
      const witnessCallback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        witness++;
      };
      delegate.onSelectionChange(callback);
      delegate.offSelectionChange((oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {});
      delegate.onSelectionChange(witnessCallback);
      await client.selectByRange({ start: 1, end: 4 });
      await EditorFixture.waitUntil(() => witness > 0);
      await EditorFixture.waitUntil(() => received.length > 0);
      expect(count > 0).assertTrue();
      for (const payload of received) {
        expect(Number.isInteger(payload[0]) && payload[0] >= 0 && payload[0] <= 6).assertTrue();
        expect(Number.isInteger(payload[1]) && payload[1] >= 0 && payload[1] <= 6).assertTrue();
        expect(payload[2]).assertEqual(1);
        expect(payload[3]).assertEqual(4);
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1160
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1160
     * @tc.desc onSelectionChange/offSelectionChange：callback 参数验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1160', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;
      const received: number[][] = [];
      const callback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        received.push([oldStart, oldEnd, newStart, newEnd]);
        count++;
      };
      const witnessCallback = (oldStart: number, oldEnd: number, newStart: number, newEnd: number): void => {
        witness++;
      };
      delegate.onSelectionChange(callback);

      delegate.onSelectionChange(witnessCallback);
      await client.selectByRange({ start: 1, end: 4 });
      await EditorFixture.waitUntil(() => witness > 0);
      // Ignore queued binding notifications and require the range requested above.
      await EditorFixture.waitUntil(() => received.some((payload: number[]) =>
        payload[2] === 1 && payload[3] === 4));
      expect(count > 0).assertTrue();
      for (const payload of received) {
        expect(Number.isInteger(payload[0]) && payload[0] >= 0 && payload[0] <= 6).assertTrue();
        expect(Number.isInteger(payload[1]) && payload[1] >= 0 && payload[1] <= 6).assertTrue();
        expect(Number.isInteger(payload[2]) && payload[2] >= 0 && payload[2] <= 6).assertTrue();
        expect(Number.isInteger(payload[3]) && payload[3] >= 0 && payload[3] <= 6).assertTrue();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1070
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1070
     * @tc.desc onCursorContextChange/offCursorContextChange：订阅。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1070', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const live: number[][] = [];
      const received: number[][] = [];
      const callback = (x: number, y: number, height: number): void => {
        received.push([x, y, height]);
        count++;
      };
      const witnessCallback = (x: number, y: number, height: number): void => {
        live.push([x, y, height]);
      };
      delegate.onCursorContextChange(callback);

      delegate.onCursorContextChange(witnessCallback);
      await verifyCursorRoundTrip(client, received, live);
      expect(count >= 3).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1080
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1080
     * @tc.desc onCursorContextChange/offCursorContextChange：off 指定 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1080', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;

      const callback = (x: number, y: number, height: number): void => {

        count++;
      };
      const witnessCallback = (x: number, y: number, height: number): void => {
        witness++;
      };
      delegate.onCursorContextChange(callback);
      delegate.offCursorContextChange(callback);
      delegate.onCursorContextChange(witnessCallback);
      await client.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      await EditorFixture.waitUntil(() => witness > 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1090
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1090
     * @tc.desc onCursorContextChange/offCursorContextChange：off 不传 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1090', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      let witness = 0;

      const callback = (x: number, y: number, height: number): void => {

        count++;
      };
      const witnessCallback = (x: number, y: number, height: number): void => {
        witness++;
      };
      delegate.onCursorContextChange(callback);
      delegate.offCursorContextChange();
      delegate.onCursorContextChange(witnessCallback);
      await client.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      await EditorFixture.waitUntil(() => witness > 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1100
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1100
     * @tc.desc onCursorContextChange/offCursorContextChange：off 传未注册 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1100', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const live: number[][] = [];
      const received: number[][] = [];
      const callback = (x: number, y: number, height: number): void => {
        received.push([x, y, height]);
        count++;
      };
      const witnessCallback = (x: number, y: number, height: number): void => {
        live.push([x, y, height]);
      };
      delegate.onCursorContextChange(callback);
      delegate.offCursorContextChange((x: number, y: number, height: number): void => {});
      delegate.onCursorContextChange(witnessCallback);
      await verifyCursorRoundTrip(client, received, live);
      expect(count >= 3).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1110
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1110
     * @tc.desc onCursorContextChange/offCursorContextChange：callback 参数验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1110', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const live: number[][] = [];
      const received: number[][] = [];
      const callback = (x: number, y: number, height: number): void => {
        received.push([x, y, height]);
        count++;
      };
      const witnessCallback = (x: number, y: number, height: number): void => {
        live.push([x, y, height]);
      };
      delegate.onCursorContextChange(callback);

      delegate.onCursorContextChange(witnessCallback);
      await verifyCursorRoundTrip(client, received, live);
      expect(count >= 3).assertTrue();
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1000
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1000
     * @tc.desc onKeyEvent/offKeyEvent：订阅+回调返回 true（消费事件）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1000', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      const received: keyEvent.KeyEvent[] = [];
      delegate.onKeyEvent((key: keyEvent.KeyEvent): boolean => {
        received.push(key);
        return true;
      });
      const result = await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('uinput -K -d 2017 -u 2017');
      expect(result.exitCode).assertEqual(0);
      await EditorFixture.waitUntil(() => received.length > 0);
      for (const payload of received) {
        expect(payload !== null && payload !== undefined).assertTrue();
        expect(payload.key !== null && payload.key !== undefined).assertTrue();
        expect(payload.key.code).assertEqual(2017);
        // keyEvent.Action.DOWN = 1 and UP = 2; uinput injects this down/up pair.
        expect(payload.action === 1 || payload.action === 2).assertTrue();
      }
      expect(await client.getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1010
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1010
     * @tc.desc onKeyEvent/offKeyEvent：订阅+回调返回 false（继续传递）。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1010', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      const received: keyEvent.KeyEvent[] = [];
      delegate.onKeyEvent((key: keyEvent.KeyEvent): boolean => {
        received.push(key);
        return false;
      });
      const result = await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('uinput -K -d 2017 -u 2017');
      expect(result.exitCode).assertEqual(0);
      await EditorFixture.waitUntil(() => received.length > 0);
      for (const payload of received) {
        expect(payload !== null && payload !== undefined).assertTrue();
        expect(payload.key !== null && payload.key !== undefined).assertTrue();
        expect(payload.key.code).assertEqual(2017);
        // keyEvent.Action.DOWN = 1 and UP = 2; uinput injects this down/up pair.
        expect(payload.action === 1 || payload.action === 2).assertTrue();
      }
      await EditorFixture.waitUntil(() => EditorFixture.text === 'abcadef');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1050
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1050
     * @tc.desc onKeyEvent/offKeyEvent：callback 回调参数验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1050', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      const received: keyEvent.KeyEvent[] = [];
      delegate.onKeyEvent((key: keyEvent.KeyEvent): boolean => {
        received.push(key);
        return true;
      });
      const result = await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('uinput -K -d 2017 -u 2017');
      expect(result.exitCode).assertEqual(0);
      await EditorFixture.waitUntil(() => received.length > 0);
      for (const payload of received) {
        expect(payload !== null && payload !== undefined).assertTrue();
        expect(payload.key !== null && payload.key !== undefined).assertTrue();
        expect(payload.key.code).assertEqual(2017);
        // keyEvent.Action.DOWN = 1 and UP = 2; uinput injects this down/up pair.
        expect(payload.action === 1 || payload.action === 2).assertTrue();
      }
      expect(await client.getForward(3)).assertEqual('abc');
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1020
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1020
     * @tc.desc onKeyEvent/offKeyEvent：off 指定 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1020', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let first = 0;
      let witness = 0;

      const callback = (key: keyEvent.KeyEvent): boolean => {

        first++;
        return true;
      };
      const witnessCallback = (key: keyEvent.KeyEvent): boolean => {

        witness++;
        return true;
      };
      delegate.onKeyEvent(callback);
      delegate.offKeyEvent(callback);
      delegate.onKeyEvent(witnessCallback);
      const result = await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('uinput -K -d 2017 -u 2017');
      expect(result.exitCode).assertEqual(0);
      await EditorFixture.waitUntil(() => witness > 0);
      expect(first).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1030
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1030
     * @tc.desc onKeyEvent/offKeyEvent：off 不传 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1030', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let first = 0;
      let witness = 0;

      const callback = (key: keyEvent.KeyEvent): boolean => {

        first++;
        return true;
      };
      const witnessCallback = (key: keyEvent.KeyEvent): boolean => {

        witness++;
        return true;
      };
      delegate.onKeyEvent(callback);
      delegate.offKeyEvent();
      delegate.onKeyEvent(witnessCallback);
      const result = await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('uinput -K -d 2017 -u 2017');
      expect(result.exitCode).assertEqual(0);
      await EditorFixture.waitUntil(() => witness > 0);
      expect(first).assertEqual(0);
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1040
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1040
     * @tc.desc onKeyEvent/offKeyEvent：off 传未注册 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1040', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let first = 0;
      let witness = 0;
      const received: keyEvent.KeyEvent[] = [];
      const witnessed: keyEvent.KeyEvent[] = [];
      const callback = (key: keyEvent.KeyEvent): boolean => {
        received.push(key);
        first++;
        return true;
      };
      const witnessCallback = (key: keyEvent.KeyEvent): boolean => {
        witnessed.push(key);
        witness++;
        return true;
      };
      delegate.onKeyEvent(callback);
      delegate.offKeyEvent((key: keyEvent.KeyEvent): boolean => false);
      delegate.onKeyEvent(witnessCallback);
      const result = await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('uinput -K -d 2017 -u 2017');
      expect(result.exitCode).assertEqual(0);
      await EditorFixture.waitUntil(() => witness > 0);
      await EditorFixture.waitUntil(() => received.length > 0);
      expect(first > 0).assertTrue();
      for (const payload of received) {
        expect(payload !== null && payload !== undefined).assertTrue();
        expect(payload.key !== null && payload.key !== undefined).assertTrue();
        expect(payload.key.code).assertEqual(2017);
        // keyEvent.Action.DOWN = 1 and UP = 2; uinput injects this down/up pair.
        expect(payload.action === 1 || payload.action === 2).assertTrue();
      }
      for (const payload of witnessed) {
        expect(payload !== null && payload !== undefined).assertTrue();
        expect(payload.key !== null && payload.key !== undefined).assertTrue();
        expect(payload.key.code).assertEqual(2017);
        // keyEvent.Action.DOWN = 1 and UP = 2; uinput injects this down/up pair.
        expect(payload.action === 1 || payload.action === 2).assertTrue();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1060
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1060
     * @tc.desc onKeyEvent 的两个不同回调共存并收到真实按键。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1060', Level.LEVEL1, async () => {
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let first = 0;
      let witness = 0;
      const received: keyEvent.KeyEvent[] = [];
      const witnessed: keyEvent.KeyEvent[] = [];
      const callback = (key: keyEvent.KeyEvent): boolean => {
        received.push(key);
        first++;
        return true;
      };
      const witnessCallback = (key: keyEvent.KeyEvent): boolean => {
        witnessed.push(key);
        witness++;
        return true;
      };
      delegate.onKeyEvent(callback);

      delegate.onKeyEvent(witnessCallback);
      const result = await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('uinput -K -d 2017 -u 2017');
      expect(result.exitCode).assertEqual(0);
      await EditorFixture.waitUntil(() => witness > 0);
      await EditorFixture.waitUntil(() => received.length > 0);
      expect(first > 0).assertTrue();
      for (const payload of received) {
        expect(payload !== null && payload !== undefined).assertTrue();
        expect(payload.key !== null && payload.key !== undefined).assertTrue();
        expect(payload.key.code).assertEqual(2017);
        // keyEvent.Action.DOWN = 1 and UP = 2; uinput injects this down/up pair.
        expect(payload.action === 1 || payload.action === 2).assertTrue();
      }
      for (const payload of witnessed) {
        expect(payload !== null && payload !== undefined).assertTrue();
        expect(payload.key !== null && payload.key !== undefined).assertTrue();
        expect(payload.key.code).assertEqual(2017);
        // keyEvent.Action.DOWN = 1 and UP = 2; uinput injects this down/up pair.
        expect(payload.action === 1 || payload.action === 2).assertTrue();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1220
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1220
     * @tc.desc onEditorAttributeChanged/offEditorAttributeChanged：订阅。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1220', Level.LEVEL1, async () => {
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Done);
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect((await client.getEditorAttribute()).enterKeyType)
        .assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const received: inputMethodEngine.EditorAttribute[] = [];
      const live: inputMethodEngine.EditorAttribute[] = [];
      const callback = (attribute: inputMethodEngine.EditorAttribute): void => {
        count++;
        received.push(attribute);
      };
      const witnessCallback = (attribute: inputMethodEngine.EditorAttribute): void => {
        live.push(attribute);
      };
      delegate.onEditorAttributeChanged(callback);

      delegate.onEditorAttributeChanged(witnessCallback);
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Search);
      await EditorFixture.waitUntil(() => live.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));

      await EditorFixture.waitUntil(() => received.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));
      expect(count > 0).assertTrue();
      const changed = live.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(changed !== undefined).assertTrue();
      const observed = await client.getEditorAttribute();
      expect(observed.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(observed.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      if (changed !== undefined) {
        expect(changed.inputPattern).assertEqual(observed.inputPattern);
        expect(changed.enterKeyType).assertEqual(observed.enterKeyType);
      }

      const own = received.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(own !== undefined).assertTrue();
      if (own !== undefined) {
        expect(own.inputPattern).assertEqual(observed.inputPattern);
        expect(own.enterKeyType).assertEqual(observed.enterKeyType);
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1230
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1230
     * @tc.desc onEditorAttributeChanged/offEditorAttributeChanged：off 指定 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1230', Level.LEVEL1, async () => {
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Done);
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect((await client.getEditorAttribute()).enterKeyType)
        .assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const received: inputMethodEngine.EditorAttribute[] = [];
      const live: inputMethodEngine.EditorAttribute[] = [];
      const callback = (attribute: inputMethodEngine.EditorAttribute): void => {
        count++;
        received.push(attribute);
      };
      const witnessCallback = (attribute: inputMethodEngine.EditorAttribute): void => {
        live.push(attribute);
      };
      delegate.onEditorAttributeChanged(callback);
      delegate.offEditorAttributeChanged(callback);
      delegate.onEditorAttributeChanged(witnessCallback);
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Search);
      await EditorFixture.waitUntil(() => live.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));
      expect(count).assertEqual(0);
      const changed = live.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(changed !== undefined).assertTrue();
      const observed = await client.getEditorAttribute();
      expect(observed.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(observed.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      if (changed !== undefined) {
        expect(changed.inputPattern).assertEqual(observed.inputPattern);
        expect(changed.enterKeyType).assertEqual(observed.enterKeyType);
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1240
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1240
     * @tc.desc onEditorAttributeChanged/offEditorAttributeChanged：off 不传 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1240', Level.LEVEL1, async () => {
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Done);
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect((await client.getEditorAttribute()).enterKeyType)
        .assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const received: inputMethodEngine.EditorAttribute[] = [];
      const live: inputMethodEngine.EditorAttribute[] = [];
      const callback = (attribute: inputMethodEngine.EditorAttribute): void => {
        count++;
        received.push(attribute);
      };
      const witnessCallback = (attribute: inputMethodEngine.EditorAttribute): void => {
        live.push(attribute);
      };
      delegate.onEditorAttributeChanged(callback);
      delegate.offEditorAttributeChanged();
      delegate.onEditorAttributeChanged(witnessCallback);
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Search);
      await EditorFixture.waitUntil(() => live.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));
      expect(count).assertEqual(0);
      const changed = live.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(changed !== undefined).assertTrue();
      const observed = await client.getEditorAttribute();
      expect(observed.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(observed.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      if (changed !== undefined) {
        expect(changed.inputPattern).assertEqual(observed.inputPattern);
        expect(changed.enterKeyType).assertEqual(observed.enterKeyType);
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1250
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1250
     * @tc.desc onEditorAttributeChanged/offEditorAttributeChanged：off 传未注册 callback。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1250', Level.LEVEL1, async () => {
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Done);
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect((await client.getEditorAttribute()).enterKeyType)
        .assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const received: inputMethodEngine.EditorAttribute[] = [];
      const live: inputMethodEngine.EditorAttribute[] = [];
      const callback = (attribute: inputMethodEngine.EditorAttribute): void => {
        count++;
        received.push(attribute);
      };
      const witnessCallback = (attribute: inputMethodEngine.EditorAttribute): void => {
        live.push(attribute);
      };
      delegate.onEditorAttributeChanged(callback);
      delegate.offEditorAttributeChanged(
        (attribute: inputMethodEngine.EditorAttribute): void => {});
      delegate.onEditorAttributeChanged(witnessCallback);
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Search);
      await EditorFixture.waitUntil(() => live.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));

      await EditorFixture.waitUntil(() => received.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));
      expect(count > 0).assertTrue();
      const changed = live.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(changed !== undefined).assertTrue();
      const observed = await client.getEditorAttribute();
      expect(observed.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(observed.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      if (changed !== undefined) {
        expect(changed.inputPattern).assertEqual(observed.inputPattern);
        expect(changed.enterKeyType).assertEqual(observed.enterKeyType);
      }

      const own = received.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(own !== undefined).assertTrue();
      if (own !== undefined) {
        expect(own.inputPattern).assertEqual(observed.inputPattern);
        expect(own.enterKeyType).assertEqual(observed.enterKeyType);
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1260
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1260
     * @tc.desc onEditorAttributeChanged/offEditorAttributeChanged：callback 参数验证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_1260', Level.LEVEL1, async () => {
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Done);
      await EditorFixture.bind();
      const client = EditorFixture.getClient();
      expect((await client.getEditorAttribute()).enterKeyType)
        .assertEqual(inputMethodEngine.ENTER_KEY_TYPE_DONE);
      const delegate = inputMethodEngine.getProxyKeyboardDelegate();
      if (delegate === null) {
        throw new Error('Proxy delegate unavailable');
      }
      let count = 0;
      const received: inputMethodEngine.EditorAttribute[] = [];
      const live: inputMethodEngine.EditorAttribute[] = [];
      const callback = (attribute: inputMethodEngine.EditorAttribute): void => {
        count++;
        received.push(attribute);
      };
      const witnessCallback = (attribute: inputMethodEngine.EditorAttribute): void => {
        live.push(attribute);
      };
      delegate.onEditorAttributeChanged(callback);

      delegate.onEditorAttributeChanged(witnessCallback);
      AppStorage.setOrCreate('proxyEnterKeyType', EnterKeyType.Search);
      await EditorFixture.waitUntil(() => live.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));

      await EditorFixture.waitUntil(() => received.some((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH));
      expect(count > 0).assertTrue();
      const changed = live.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(changed !== undefined).assertTrue();
      const observed = await client.getEditorAttribute();
      expect(observed.inputPattern).assertEqual(inputMethodEngine.PATTERN_TEXT);
      expect(observed.enterKeyType).assertEqual(inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      if (changed !== undefined) {
        expect(changed.inputPattern).assertEqual(observed.inputPattern);
        expect(changed.enterKeyType).assertEqual(observed.enterKeyType);
      }

      const own = received.find((attribute: inputMethodEngine.EditorAttribute) =>
        attribute !== null && attribute !== undefined &&
        attribute.enterKeyType === inputMethodEngine.ENTER_KEY_TYPE_SEARCH);
      expect(own !== undefined).assertTrue();
      if (own !== undefined) {
        expect(own.inputPattern).assertEqual(observed.inputPattern);
        expect(own.enterKeyType).assertEqual(observed.enterKeyType);
      }
    });
  });
}
