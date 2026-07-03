import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct DatePickerDialogSystemMaterial {
  selectedDate: Date = new Date('2024-1-1');

  showDialog(material: uiMaterial.Material | null | undefined) {
    this.getUIContext().showDatePickerDialog({
      start: new Date('2024-1-1'),
      end: new Date('2025-12-31'),
      selected: this.selectedDate,
      systemMaterial: material,
    })
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Button('ULTRA_THICK')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            interactive: true,
          }))
        })
        .id('ultraThickID')

      Button('THICK')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THICK,
            interactive: true,
          }))
        })
        .id('thickID')

      Button('REGULAR')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR,
            interactive: true,
          }))
        })
        .id('regularID')

      Button('THIN')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THIN,
            interactive: true,
          }))
        })
        .id('thinID')

      Button('ULTRA_THIN')
        .onClick(() => {
          this.showDialog(new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
            interactive: true,
          }))
        })
        .id('ultraThinID')

      Button('undefined')
        .onClick(() => {
          this.showDialog(undefined)
        })
        .id('undefinedID')

      Button('null')
        .onClick(() => {
          this.showDialog(null)
        })
        .id('nullID')
    }.width('100%')
  }
}
