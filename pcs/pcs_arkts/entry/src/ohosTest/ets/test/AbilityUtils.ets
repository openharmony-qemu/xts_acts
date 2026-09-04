/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default class AbilityUtils {
  static ERROR_CODE_ABILITY_IS_STARTING = 16000082
  static BUNDLE_ARKTS = 'com.acts.pcs.arktstest'
  static async startAbility(bundleName: string, abilityName: string, context: common.UIAbilityContext) {
    let want: Want = {
      bundleName: bundleName,
      abilityName: abilityName
    }
    // 同包 TestAbility/EntryAbility 并存时，用 startAbility 拉起前台；
    // 避免 startAbilityForResult 回调式 await 未真正等待。
    try {
      await context.startAbility(want)
      console.info('startAbility succeed')
      return true
    } catch (error) {
      let err = error as BusinessError
      console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`)
      if (err.code == AbilityUtils.ERROR_CODE_ABILITY_IS_STARTING) {
        return true
      }
      return false
    }
  }

  static async startAbilityImplicitly(wantInfo: Want, context: common.UIAbilityContext) {
    let res = true
    try {
      await context.startAbility(wantInfo);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to startAbilityImplicitly. code is ${err.code}, message is ${err.message}`)
      if (err.code != AbilityUtils.ERROR_CODE_ABILITY_IS_STARTING) {
        res = false
      }
    }
    return res
  }

  /** 通过 aa start 拉起 Entry，比同进程 startAbility 更容易拿到窗口焦点 */
  static async startEntryViaShell(): Promise<boolean> {
    try {
      let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
      let result = await delegator.executeShellCommand(
        `aa start -a EntryAbility -b ${AbilityUtils.BUNDLE_ARKTS}`)
      console.info(`startEntryViaShell: ${result}`)
      return true
    } catch (error) {
      let err = error as BusinessError
      console.error(`startEntryViaShell fail: ${err.code} ${err.message}`)
      return false
    }
  }

  /**
   * 同包双 Ability 时 inWindow(bundle) 不可区分窗口；逐个 focus 候选窗，直到找到 Entry Index 的 scroll。
   */
  static async findEntryScroll(driver: Driver): Promise<Component | null> {
    // 先等组件出现在任一窗口
    try {
      let waited = await driver.waitForComponent(ON.id('scroll'), 8000)
      if (waited != null) {
        console.info('findEntryScroll: waitForComponent scroll ok')
        return waited
      }
    } catch (error) {
      console.error('findEntryScroll waitForComponent scroll miss')
    }
    try {
      let waitedBtn = await driver.waitForComponent(ON.id('firstButton'), 3000)
      if (waitedBtn != null) {
        let scroll = await driver.findComponent(ON.id('scroll'))
        if (scroll != null) {
          return scroll
        }
      }
    } catch (error) {
      console.error('findEntryScroll waitForComponent firstButton miss')
    }

    let titles: string[] = ['arktstest0', 'arktstest1', 'arktstest2', 'arktstest3']
    for (let i = 0; i < titles.length; i++) {
      let title = titles[i]
      try {
        let win = await driver.findWindow({ title: title })
        if (win == undefined || win == null) {
          continue
        }
        await win.focus()
        await driver.delayMs(1000)
        let scroll = await driver.findComponent(ON.id('scroll'))
        if (scroll != null) {
          console.info(`findEntryScroll: hit scroll on ${title}`)
          return scroll
        }
      } catch (error) {
        let err = error as BusinessError
        console.error(`findEntryScroll ${title}: code=${err.code}, msg=${err.message}`)
      }
    }
    // 按 bundle 找 active 窗
    try {
      let win = await driver.findWindow({ bundleName: AbilityUtils.BUNDLE_ARKTS, active: true })
      if (win != undefined && win != null) {
        await win.focus()
        await driver.delayMs(1000)
        let scroll = await driver.findComponent(ON.id('scroll'))
        if (scroll != null) {
          console.info('findEntryScroll: hit scroll on active window')
          return scroll
        }
      }
    } catch (error) {
      console.error('findEntryScroll active window miss')
    }
    try {
      return await driver.findComponent(ON.id('scroll'))
    } catch (error) {
      return null
    }
  }

  static async startEntryAndFindScroll(context: common.UIAbilityContext, driver: Driver): Promise<Component | null> {
    // 优先 shell aa start（与手工 uitest dump 时一致），失败再 startAbility
    let viaShell = await AbilityUtils.startEntryViaShell()
    if (!viaShell) {
      await AbilityUtils.startAbility(AbilityUtils.BUNDLE_ARKTS, 'EntryAbility', context)
    }
    await driver.delayMs(3000)
    let scroll = await AbilityUtils.findEntryScroll(driver)
    if (scroll != null) {
      return scroll
    }
    // 再试一次 context.startAbility + focus
    await AbilityUtils.startAbility(AbilityUtils.BUNDLE_ARKTS, 'EntryAbility', context)
    await driver.delayMs(3000)
    return await AbilityUtils.findEntryScroll(driver)
  }

}
