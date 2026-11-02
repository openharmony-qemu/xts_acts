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
import { inputMethod, inputMethodEngine } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { EditorFixture } from './EditorFixture';
import { CapacityFixture } from './CapacityFixture';

function expectProxyAbility(value: inputMethodEngine.ProxyInputMethodAbility | null): void {
  expect(value !== null && value !== undefined).assertTrue();
  if (value !== null && value !== undefined) {
    expect(typeof value.onInputStart).assertEqual('function');
    expect(typeof value.onUnregister).assertEqual('function');
  }
}

function expectProxyDelegate(value: inputMethodEngine.ProxyKeyboardDelegate | null): void {
  expect(value !== null && value !== undefined).assertTrue();
  if (value !== null && value !== undefined) {
    expect(typeof value.onKeyEvent).assertEqual('function');
    expect(typeof value.onTextChange).assertEqual('function');
  }
}

export default function inAppProxyCapacity(): void {
  describe('inAppProxyCapacity', () => {
    beforeEach(async () => { await EditorFixture.cleanup(); });
    afterEach(async () => { await EditorFixture.cleanup(); });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0480
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0480
     * @tc.desc 真实注册容量超限淘汰本进程后触发 onUnregister。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0480', Level.LEVEL1, async () => {
      const pool = new CapacityFixture();
      try {
        await pool.prepare();
        await pool.foreground();
        await EditorFixture.bind();
        const previousClient = EditorFixture.getClient();
        await inputMethod.getController().detach();
        EditorFixture.blur();
        let unbound = false;
        for (let attempt = 0; attempt < 100; attempt++) {
          try {
            await previousClient.getEditorAttribute();
          } catch (error) {
            const failure = error as BusinessError;
            if (failure.code !== 12800003) {
              throw new Error('Unexpected detach precondition error: ' + failure.code);
            }
            unbound = true;
            break;
          }
          await EditorFixture.delay(50);
        }
        expect(unbound).assertTrue();
        const sink = await Driver.create().waitForComponent(ON.id('focusSink').focused(true), 3000);
        expect(await sink.isFocused()).assertTrue();
        await inputMethodEngine.registerInAppProxyIme();
        const ability = inputMethodEngine.getProxyInputMethodAbility();
        if (ability === null) {
          throw new Error('Proxy ability unavailable');
        }
        let count = 0;
        let witness = 0;
        const callback = (): void => { count++; };
        const liveWitness = (): void => { witness++; };
        ability.onUnregister(callback);
        ability.onUnregister(liveWitness);
        await pool.evict();
        await pool.foreground();
        await EditorFixture.waitUntil(() => witness === 1);
        await EditorFixture.delay(300);
        expect(witness).assertEqual(1);
        expect(count).assertEqual(1);
      } finally {
        await pool.cleanup();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0490
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0490
     * @tc.desc offUnregister 取消全部回调，真实淘汰时由独立活跃监听作事件见证。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0490', Level.LEVEL1, async () => {
      const pool = new CapacityFixture();
      try {
        await pool.prepare();
        await pool.foreground();
        await EditorFixture.bind();
        const previousClient = EditorFixture.getClient();
        await inputMethod.getController().detach();
        EditorFixture.blur();
        let unbound = false;
        for (let attempt = 0; attempt < 100; attempt++) {
          try {
            await previousClient.getEditorAttribute();
          } catch (error) {
            const failure = error as BusinessError;
            if (failure.code !== 12800003) {
              throw new Error('Unexpected detach precondition error: ' + failure.code);
            }
            unbound = true;
            break;
          }
          await EditorFixture.delay(50);
        }
        expect(unbound).assertTrue();
        const sink = await Driver.create().waitForComponent(ON.id('focusSink').focused(true), 3000);
        expect(await sink.isFocused()).assertTrue();
        await inputMethodEngine.registerInAppProxyIme();
        const ability = inputMethodEngine.getProxyInputMethodAbility();
        if (ability === null) {
          throw new Error('Proxy ability unavailable');
        }
        let count = 0;
        let witness = 0;
        const callback = (): void => { count++; };
        const liveWitness = (): void => { witness++; };
        ability.onUnregister(callback);
        ability.offUnregister();
        ability.onUnregister(liveWitness);
        await pool.evict();
        await pool.foreground();
        await EditorFixture.waitUntil(() => witness === 1);
        await EditorFixture.delay(300);
        expect(witness).assertEqual(1);
        expect(count).assertEqual(0);
      } finally {
        await pool.cleanup();
      }
    });

    /**
     * @tc.name SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0550
     * @tc.number SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0550
     * @tc.desc 被动注销后监听对象仍可获取，重新注册后恢复真实编辑。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level Level1
     */
    it('SUB_INPUTMETHOD_IME_CUSTOMKEYBOARD_0550', Level.LEVEL1, async () => {
      const pool = new CapacityFixture();
      try {
        await pool.prepare();
        await pool.foreground();
        await EditorFixture.bind();
        const previousClient = EditorFixture.getClient();
        await inputMethod.getController().detach();
        EditorFixture.blur();
        let unbound = false;
        for (let attempt = 0; attempt < 100; attempt++) {
          try {
            await previousClient.getEditorAttribute();
          } catch (error) {
            const failure = error as BusinessError;
            if (failure.code !== 12800003) {
              throw new Error('Unexpected detach precondition error: ' + failure.code);
            }
            unbound = true;
            break;
          }
          await EditorFixture.delay(50);
        }
        expect(unbound).assertTrue();
        const sink = await Driver.create().waitForComponent(ON.id('focusSink').focused(true), 3000);
        expect(await sink.isFocused()).assertTrue();
        await inputMethodEngine.registerInAppProxyIme();
        const ability = inputMethodEngine.getProxyInputMethodAbility();
        if (ability === null) {
          throw new Error('Proxy ability unavailable');
        }
        let count = 0;
        let witness = 0;
        const callback = (): void => { count++; };
        const liveWitness = (): void => { witness++; };
        ability.onUnregister(callback);
        ability.onUnregister(liveWitness);
        await pool.evict();
        await pool.foreground();
        await EditorFixture.waitUntil(() => witness === 1);
        await EditorFixture.delay(300);
        expect(witness).assertEqual(1);
        expect(count).assertEqual(1);
        expectProxyAbility(inputMethodEngine.getProxyInputMethodAbility());
        expectProxyDelegate(inputMethodEngine.getProxyKeyboardDelegate());
        EditorFixture.blur();
        await EditorFixture.bind('abcdef', 3);
        await EditorFixture.getClient().insertText('X');
        await EditorFixture.waitUntil(() => EditorFixture.text === 'abcXdef');
        expect(await EditorFixture.getClient().getForward(4)).assertEqual('abcX');
      } finally {
        await pool.cleanup();
      }
    });
  });
}
