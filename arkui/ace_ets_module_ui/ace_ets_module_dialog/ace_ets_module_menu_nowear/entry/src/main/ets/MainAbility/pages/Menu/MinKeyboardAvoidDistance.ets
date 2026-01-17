import { inputMethod } from '@kit.IMEKit';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct KeyboardAvoidModeNone {
  private inputController: inputMethod.InputMethodController = inputMethod.getController();

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '1MenuItemContent' })
      MenuItem({ content: '2MenuItemContent' })
      MenuItem({ content: '3MenuItemContent' })
      MenuItem({ content: '4MenuItemContent' })
      MenuItem({ content: '5MenuItemContent' })
    }.id('myMenu1')
  }

  build() {
    RelativeContainer() {
      Button('Click Show Menu')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
        })
        .bindMenu(this.MyMenu, {
          keyboardAvoidMode: MenuKeyboardAvoidMode.NONE,
          minKeyboardAvoidDistance: undefined
        })
        .id('showId')
        .onClick(() => {
          setTimeout(() => {
            this.attachAndListener()
          }, 2000)
        })
    }
    .height('100%')
    .width('100%')

  }

  async attachAndListener() {
    focusControl.requestFocus('Index')
    try {
      await this.inputController.attach(true, {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.SEARCH
        }
      })
    } catch (err) {
      console.error('Fail to attach')
    }
  }
}