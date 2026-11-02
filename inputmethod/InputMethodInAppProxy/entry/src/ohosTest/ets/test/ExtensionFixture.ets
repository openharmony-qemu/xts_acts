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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import process from '@ohos.process';
import { EditorFixture } from './EditorFixture';

export interface ExtensionResult {
  operation: string;
  code: number;
  message: string;
  pid: number;
  stamp: number;
}

let cached: ExtensionResult[] | null = null;

export async function extensionProbe(): Promise<ExtensionResult[]> {
  if (cached !== null) {
    return cached;
  }
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const current = await delegator.executeShellCommand('ime -g');
  const match = current.stdResult.match(/The current input method is:\s*([A-Za-z0-9_.]+)/);
  if (match === null) {
    throw new Error('Cannot preserve original IME');
  }
  const original = match[1];
  const bundle = abilityDelegatorRegistry.getArguments().bundleName;
  if (original === bundle || !/^[A-Za-z0-9_.]+$/.test(bundle)) {
    throw new Error('Unexpected initial IME configuration');
  }
  const started = Date.now();
  const rows: ExtensionResult[] = [];
  try {
    EditorFixture.focus();
    await delegator.executeShellCommand('ime -e ' + bundle + ' -b');
    const selected = await delegator.executeShellCommand('ime -s ' + bundle);
    if (selected.exitCode !== 0) {
      throw new Error('Cannot select the real IME extension');
    }
    for (let attempt = 0; attempt < 100; attempt++) {
      const log = await delegator.executeShellCommand('hilog -x -T XtsProxyExt');
      rows.length = 0;
      for (const line of log.stdResult.split('\n')) {
        const marker = line.indexOf('{');
        if (marker < 0) {
          continue;
        }
        const row = JSON.parse(line.substring(marker)) as ExtensionResult;
        if (row.stamp >= started && row.pid !== process.pid &&
          ['ability', 'delegate', 'register', 'unregister'].includes(row.operation) &&
          !rows.some((previous: ExtensionResult) => previous.operation === row.operation)) {
          rows.push(row);
        }
      }
      if (rows.length === 4) {
        break;
      }
      await new Promise<void>((resolve) => setTimeout(resolve, 100));
    }
    if (rows.length !== 4) {
      throw new Error('No complete result from the actual extension process');
    }
  } finally {
    try {
      await delegator.executeShellCommand('ime -s ' + original);
      const restored = await delegator.executeShellCommand('ime -g');
      if (restored.stdResult.trim() !== current.stdResult.trim()) {
        throw new Error('Original IME bundle/mode was not restored');
      }
    } finally {
      // Disable the temporary extension even when restoration fails.
      const disabled = await delegator.executeShellCommand('ime -d ' + bundle);
      if (!disabled.stdResult.includes('Succeeded in disabling IME')) {
        throw new Error('Temporary IME extension was not disabled');
      }
    }
  }
  cached = rows;
  return rows;
}
