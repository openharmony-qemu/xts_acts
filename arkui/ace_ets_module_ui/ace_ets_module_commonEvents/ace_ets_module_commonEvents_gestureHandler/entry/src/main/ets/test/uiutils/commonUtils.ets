import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { common, UIAbility } from '@kit.AbilityKit';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator()
const BUNDLE = 'com.open.harmony.acetestcommenventgestureHandler'

export async function startPage(pageKey: string) {
  await destoryAbility();
  await sleep(1000)
  console.log(`www: pageKey ${pageKey}`)
  await delegator.startAbility({
    bundleName: BUNDLE,
    abilityName: 'EntryAbility',
    parameters: { pageKey },
  })
}

export async function destoryAbility() {
  let b:common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('context')
  console.log(`ww:b ${b}`)
  await b?.terminateSelf()
}

export async function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}