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
import { UIAbility } from '@kit.AbilityKit';
import { EditorFixture } from './EditorFixture';
import hilog from '@ohos.hilog';


export class CapacityFixture {
  private created: boolean = false;
  private ability: UIAbility | null = null;
  private root: string = '/data/local/tmp/acts-inapp-proxy-capacity-' + Date.now();

  private async shell(command: string): Promise<string> {
    const result = await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(command);
    if (result.exitCode !== 0) {
      throw new Error(
        'Capacity fixture command failed: ' + command + ' code=' + result.exitCode + ': ' + result.stdResult);
    }
    return result.stdResult;
  }

  private async job(mode: string, marker: string): Promise<string> {
    const token = this.root.substring(this.root.lastIndexOf('-') + 1);
    hilog.info(0x0044, 'XtsCapacityRequest', '%{public}s', '====> token=' + token + ' mode=' + mode);
    for (let attempt = 0; attempt < 1200; attempt++) {
      const log = await this.shell('hilog -x -T XtsCapacityServer');
      const prefix = 'token=' + token + ' mode=' + mode + ' status=';
      const rows = log.split('\n').filter((line: string) => line.includes(prefix));
      if (rows.some((line: string) => line.includes(prefix + 'FAIL'))) {
        throw new Error('Real capacity fixture failed: ' + rows.join('\n'));
      }
      if (rows.some((line: string) => line.includes(prefix + 'DONE'))) {
        const output = rows.filter((line: string) => line.includes(prefix + 'ROW ')).map((
          line: string) => line.substring(line.indexOf(prefix + 'ROW ') +
          (prefix + 'ROW ').length)).join('\n');
        if (!output.includes(marker)) {
          throw new Error('Capacity completion has no actual native evidence: ' + output);
        }
        const loggedOutput = output.split('\n').map((line: string) =>
          line.startsWith('====> ') ? line : '====> ' + line).join('\n');
        console.info('====> XtsProxyCapacity ' + mode + ' ' + this.root + '\n' + loggedOutput);
        return output;
      }
      await EditorFixture.delay(100);
    }
    throw new Error('Real capacity fixture timed out: ' + mode + ' ' + this.root);
  }

  async prepare(): Promise<void> {
    try {
      this.ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      this.created = true;
      await this.job('prepare', 'POOL_READY 100');
    } catch (error) {
      const failure = error as Error;
      throw new Error('Capacity prepare failed: ' + failure.message);
    }
  }

  async evict(): Promise<void> {
    const output = await this.job('evict', 'EVICTION_LOAD_COMPLETE 100');
    const rows = output.split('\n').filter((line: string) => line.startsWith('REGISTER_OK '));
    const identities: string[] = [];
    for (const row of rows) {
      const fields = row.trim().split(' ');
      const pid = fields[2];
      if (!/^[0-9]+$/.test(pid) || identities.includes(pid)) {
        throw new Error('Duplicate or invalid real worker identity: ' + row);
      }
      identities.push(pid);
    }
    if (rows.length !== 100 || identities.length !== 100) {
      throw new Error('Capacity requires 100 successful distinct live process registrations');
    }
  }

  async foreground(): Promise<void> {
    try {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      if (this.ability === null) {
        throw new Error('Original test ability was not captured');
      }
      if (!EditorFixture.windowActive) {
        await delegator.doAbilityBackground(this.ability);
      }
      await delegator.doAbilityForeground(this.ability);
      await EditorFixture.waitUntil(() => EditorFixture.windowActive);
    } catch (error) {
      const failure = error as Error;
      throw new Error('Capacity foreground failed: ' + failure.message);
    }
  }

  async cleanup(): Promise<void> {
    if (!this.created) {
      return;
    }
    await this.job('cleanup', 'CLEANUP_PASS');
    await this.foreground();
  }
}
