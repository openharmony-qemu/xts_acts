import { ComponentInit, UIUtils, CustomComponentLifecycleObserver } from '@kit.ArkUI';

@Entry
@Component
struct LifeCycle0300 {
  @State switch: boolean = true;

  build() {
    Column() {
      Button('Hello')
        .id('LifeCycle0300_01')
        .height('5%')
        .onClick(() => {
          this.switch = !this.switch;
        })
      if (this.switch) {
        // 如果只有一个复用的组件，可以不用设置reuseId。
        Child0300({ message: 'www' })
          .reuseId('Child0300')
      }

    }
    .height('100%')
    .width('100%')

  }
}

@Reusable
@Component
struct Child0300 {
  @State message: string = 'qqq';
  @State label: string = 'HelloWorld';

  @ComponentInit
  myInit(): void {
    UIUtils.getLifecycle(this).addObserver(observer0300)
    UIUtils.getLifecycle(this).addObserver(observer0301)
  }

  aboutToDisappear(): void {
    UIUtils.getLifecycle(this).removeObserver(observer0300)
    UIUtils.getLifecycle(this).removeObserver(observer0301)
  }

  build() {
    Column() {
      Text(this.label)
        .height('5%')
    }
  }
}

export class MyObserver0300 implements CustomComponentLifecycleObserver {
  aboutToReuse(params: Record<string, Object | null | undefined>): void {
    AppStorage.setOrCreate<string>('aboutToReuse0030', Object.values(params!)[0] as string)
  }
}

export class MyObserver0301 implements CustomComponentLifecycleObserver {
  aboutToReuse(): void {
    AppStorage.setOrCreate <boolean> ('aboutToReuse0301', true)
  }
}

// 创建Observer对象
const observer0300 = new MyObserver0300();
const observer0301 = new MyObserver0301();