/**
 * overlayManager 侧滑事件拦截 Demo（极简版）
 *
 * 功能：
 *   - 点击按钮通过 overlayManager 添加一个浮层
 *   - enableBackPressedEvent + onBackPress 拦截侧滑/返回键
 *   - 有浮层时 return true 拦截并移除浮层
 *   - 无浮层时 return false 透传给 Navigation
 */

import { ComponentContent, OverlayManagerOptions } from '@kit.ArkUI'

// ── 浮层参数 ──

class FloatParams {
  message: string = ''
  onDismiss: () => void = () => {}

  constructor(message: string, onDismiss: () => void) {
    this.message = message
    this.onDismiss = onDismiss
  }
}

@Builder
function floatBuilder(params: FloatParams) {
  Column({ space: 12 }) {
    Text(params.message)
      .fontSize(18)
      .fontWeight(FontWeight.Medium)
      .fontColor(Color.White)

    Text('侧滑被overlay拦截，按关闭可关闭overlay')
      .fontSize(12)
      .fontColor('#FFFFFFAA')

    Button('关闭')
      .height(32)
      .fontSize(13)
      .backgroundColor('#FFFFFF33')
      .fontColor(Color.White)
      .onClick(() => params.onDismiss())
  }
  .width('70%')
  .height(200)
  .justifyContent(FlexAlign.Center)
  .borderRadius(16)
  .backgroundColor('#333333')
  .shadow({ radius: 20, color: '#66000000', offsetX: 0, offsetY: 6 })
}

// ── 主页面 ──

@Entry
@Component
struct OverlayBackPressSimpleDemo {
  @State showStatus: string = '无浮层'
  @State logText: string = ''
  @State stateNumber: number = 0
  private floatContent: ComponentContent<FloatParams> | null = null
  private optionsSet: boolean = false

  addLog(msg: string): void {
    let now = new Date()
    let ts = `${now.getHours()}:${now.getMinutes()}:${now.getSeconds()}`
    this.logText = `[${ts}] ${msg}\n` + this.logText
  }

  ensureOptions(): void {
    if (this.optionsSet) {
      return
    }
    let ctx = this.getUIContext()
    let ret = ctx.setOverlayManagerOptions({
      enableBackPressedEvent: true,
      onBackPress: (): boolean => {
        if (this.floatContent !== null) {
          this.addLog('onBackPress → 有浮层, return TRUE (拦截)')
          try {
            this.getUIContext().getPromptAction().showToast({
              message: 'backPress事件被overlay拦截',
              duration: 2000,
              // 控制是否设置系统材质
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          };
          return true
        }
        this.addLog('onBackPress → 无浮层, return FALSE (透传)')
        return false
      }
    } as OverlayManagerOptions)
    this.optionsSet = ret
    this.addLog(`setOverlayManagerOptions: ${ret}`)
  }

  ensureOptions1(): void {
    if (this.optionsSet) {
      return
    }
    let ctx = this.getUIContext()
    let ret = ctx.setOverlayManagerOptions({
      enableBackPressedEvent: true,
      onBackPress: (): boolean => {
        if (this.floatContent !== null) {
          this.addLog('onBackPress → 有浮层, return TRUE (拦截)')
          try {
            this.getUIContext().getPromptAction().showToast({
              message: 'backPress事件被overlay拦截',
              duration: 2000,
              // 控制是否设置系统材质
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          };
          return false
        }
        this.addLog('onBackPress → 无浮层, return FALSE (透传)')
        return false
      }
    } as OverlayManagerOptions)
    this.optionsSet = ret
    this.addLog(`setOverlayManagerOptions: ${ret}`)
  }

  ensureOptions2(): void {
    if (this.optionsSet) {
      return
    }
    let ctx = this.getUIContext()
    let ret = ctx.setOverlayManagerOptions({
      enableBackPressedEvent: true,
      onBackPress: (): boolean => {
        if (this.floatContent !== null) {
          this.addLog('onBackPress → 有浮层, return TRUE (拦截)')
          try {
            this.getUIContext().getPromptAction().showToast({
              message: 'backPress事件被overlay拦截',
              duration: 2000,
              // 控制是否设置系统材质
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          };
          return undefined
        }
        this.addLog('onBackPress → 无浮层, return FALSE (透传)')
        return false
      }
    } as OverlayManagerOptions)
    this.optionsSet = ret
    this.addLog(`setOverlayManagerOptions: ${ret}`)
  }

  showFloat(): void {
    if (this.floatContent !== null) {
      this.addLog('浮层已存在')
      return
    }
    if (this.stateNumber == 0) {
      this.ensureOptions()
    } else if (this.stateNumber == 1) {
      this.ensureOptions1()
    } else {
      this.ensureOptions2()
    }

    let ctx = this.getUIContext()
    let om = ctx.getOverlayManager()
    let params = new FloatParams('我是浮层', () => { this.dismissFloat() })
    this.floatContent = new ComponentContent(
      ctx, wrapBuilder<[FloatParams]>(floatBuilder), params)
    om.addComponentContent(this.floatContent)
    this.showStatus = '浮层显示中'
    this.addLog('打开浮层')
  }

  dismissFloat(): void {
    if (this.floatContent === null) {
      return
    }
    let ctx = this.getUIContext()
    let om = ctx.getOverlayManager()
    om.removeComponentContent(this.floatContent!)
    this.floatContent = null
    this.showStatus = '无浮层'
    this.addLog('关闭浮层')
  }

  build() {
    Column({ space: 16 }) {
      Text('overlayManager 侧滑拦截')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)

      Text('• 点击按钮添加浮层\n• 有浮层时侧滑/返回 → onBackPress return true 拦截\n• 无浮层时侧滑/返回 → onBackPress return false 透传')
        .fontSize(13)
        .fontColor('#666666')
        .lineHeight(20)

      Row({ space: 12 }) {
        Button('显示浮层')
          .id('show')
          .fontSize(15)
          .height(20)
          .backgroundColor('#2196F3')
          .onClick(() => this.showFloat())

        Button('关闭浮层')
          .id('close')
          .fontSize(15)
          .height(20)
          .backgroundColor('#F44336')
          .onClick(() => this.dismissFloat())
      }

      Row({ space: 12 }) {
        Button('测试True')
          .id('testT')
          .fontSize(15)
          .height(20)
          .backgroundColor('#2196F3')
          .onClick(() => this.stateNumber = 0)

        Button('测试False')
          .id('testF')
          .fontSize(15)
          .height(20)
          .backgroundColor('#F44336')
          .onClick(() => this.stateNumber = 1)

        Button('测试undefined')
          .id('testU')
          .fontSize(15)
          .height(20)
          .backgroundColor('#F44336')
          .onClick(() => this.stateNumber = 2)
      }

      Divider().margin({ top: 4, bottom: 4 })

      Text(`状态: ${this.showStatus}`)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)

      Scroll() {
        Text(this.logText)
          .fontSize(10)
          .fontColor('#333333')
          .width('100%')
      }
      .height(120)
      .width('100%')
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(8)
    }
    .width('100%')
    .height('100%')
    .padding(24)
  }
}