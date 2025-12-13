import { TextAreaModifier } from '@kit.ArkUI'


class MyTextAreaModifierSetExtraConfig extends TextAreaModifier {
  applyNormalAttribute?(instance: TextAreaAttribute): void {
    instance.onWillAttachIME((client: IMEClient) => {
      console.log(`Vincent MyTextAreaModifier ${client.nodeId}`)

      AppStorage.setOrCreate('TextAreaModifier_onWillAttachIME','onWillAttachIME')
      client.setExtraConfig({
        customSettings: {
          type: 'TextAreaModifier',
          name: this.name,
          id: client.nodeId,
          show: true,
          flag: 10,
        }
      })
    })
  }

  name: string = ""

  setName(name: string) {
    this.name = name
  }
}


class MyTextAreaModifierUndefiend extends TextAreaModifier {
  applyNormalAttribute?(instance: TextAreaAttribute): void {
    instance.onWillAttachIME(undefined)
    }
}


@Entry
@Component
struct TextAreaOnWillAttachIME {
  @State isHover: boolean = false
  TextAreaModifier: MyTextAreaModifierSetExtraConfig = new MyTextAreaModifierSetExtraConfig()
  TextAreaModifier2: MyTextAreaModifierUndefiend = new MyTextAreaModifierUndefiend()

  build() {
    Column() {
      TextArea({ text: 'TextArea onWillAttachIME undefined'})
        .width('90%').height('5%')
        .onChange((value: string) => {
          this.TextAreaModifier.setName(value)
        })
        .onWillAttachIME(undefined)

      TextArea({ text: 'TextAreaModifier onWillAttachIME undefined'})
        .width('90%').height('5%')
        .attributeModifier(this.TextAreaModifier2)

      TextArea({ text: 'TextAreaModifier onWillAttachIME'}).width('90%').height('5%')
        .id('TextAreaModifier_onWillAttachIME')
        .attributeModifier(this.TextAreaModifier)
        .onChange((value: string) => {
          this.TextAreaModifier.setName(value)
        })

      TextArea({ text: 'TextArea onWillAttachIME'}).width('90%').height('5%')
        .id('TextArea_onWillAttachIME')
        .onChange((value: string) => {
          this.TextAreaModifier.setName(value)
        })
        .onWillAttachIME((client: IMEClient) => {
          console.log(`Vincent TextArea ${client.nodeId}`)

          AppStorage.setOrCreate('TextArea_onWillAttachIME','onWillAttachIME')
          client.setExtraConfig({
            customSettings: {
              name: "TextArea",
              show: true,
              flag: 10,
              id: client.nodeId,
            }
          })
        })
    }
  }
}