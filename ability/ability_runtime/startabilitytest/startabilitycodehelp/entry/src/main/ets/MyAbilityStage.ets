import { AbilityConstant, AbilityStage } from '@kit.AbilityKit';

export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    console.log('MyAbilityStage.onCreate is called');
  }
  onPrepareTermination(): AbilityConstant.PrepareTermination{
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onPrepareTermination');
    return AbilityConstant.PrepareTermination.CANCEL
  }
  async onPrepareTerminationAsync(): Promise<AbilityConstant.PrepareTermination> {
    await new Promise<AbilityConstant.PrepareTermination>((res, rej) => {
      setTimeout(res, 3000); // 延时3秒后执行
    });
    return AbilityConstant.PrepareTermination.TERMINATE_IMMEDIATELY;
  }
}